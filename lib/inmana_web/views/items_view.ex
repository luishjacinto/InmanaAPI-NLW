defmodule InmanaWeb.ItemsView do
  use InmanaWeb, :view

  def render("create.json", %{item: item}) do
    %{
      message: "item created!",
      item: item
    }
  end

  def render("show.json", %{item: item}), do: %{item: item}
end
