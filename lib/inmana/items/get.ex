defmodule Inmana.Items.Get do
  alias Inmana.{Repo, Item}

  def call(uuid) do
    case Repo.get(Item, uuid) do
      nil -> {:error, %{result: "Item not found", status: :bad_request}}
      item -> {:ok, item}
    end
  end
end
