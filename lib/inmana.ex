defmodule Inmana do
  alias Inmana.Users.Create, as: UserCreate
  # alias Inmana.Users.GetItems, as: GetItems

  alias Inmana.Items.Create, as: ItemCreate
  alias Inmana.Items.Get, as: ItemGet

  defdelegate create_user(params), to: UserCreate, as: :call
  # defdelegate get_user_items(uuid), to: GetItems, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate get_item(uuid), to: ItemGet, as: :call
end
