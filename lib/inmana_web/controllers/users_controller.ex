defmodule InmanaWeb.UsersController do
  use InmanaWeb, :controller

  alias Inmana.User
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Inmana.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  # def get_items(conn, %{"id" => uuid}) do
    # with {:ok, %Item{} = item} <- Inmana.get_item(uuid) do
    #   conn
    #   |> put_status(:created)
    #   |> render("show.json", item: item)
    # end
  # end
end
