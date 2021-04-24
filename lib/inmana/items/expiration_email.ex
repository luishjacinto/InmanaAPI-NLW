defmodule Inmana.Items.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Item

  def create(to_email, items) do
    new_email(
      to: to_email,
      from: "appLuis@inmana.com.br",
      subject: "Items that are about to expire",
      text_body: email_text(items)
    )
  end

  defp email_text(items) do
    initial_text = "Items that are about to expire: \n"

    Enum.reduce(items, initial_text, fn item, text -> text <> item_string(item) end)
  end

  defp item_string(%Item{
      description: description,
      expiration_date: expiration_date,
      quantity: quantity}
    ) do
      "Description: #{description} #{quantity} unid.\nExpiration Date: #{expiration_date}\n\n"
  end
end
