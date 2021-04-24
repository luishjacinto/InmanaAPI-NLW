defmodule InmanaWeb.ItemsController do
  use InmanaWeb, :controller

  alias Inmana.Item
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Inmana.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Item{} = item} <- Inmana.get_item(uuid) do
      conn
      |> put_status(:created)
      |> render("show.json", item: item)
    end
  end
end
