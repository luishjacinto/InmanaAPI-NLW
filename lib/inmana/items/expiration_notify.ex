defmodule Inmana.Items.ExpirationNotify do

  alias Inmana.Mailer

  alias Inmana.Items.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, items} -> send_email(to_email, items) end)
    |> Stream.run()
  end

  defp send_email(to_email, items) do
    to_email
    |> ExpirationEmail.create(items)
    |> Mailer.deliver_later!()
  end
end
