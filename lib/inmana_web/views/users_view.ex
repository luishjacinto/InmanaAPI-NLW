defmodule InmanaWeb.UsersView do
  use InmanaWeb, :view

  def render("create.json", %{user: user}) do
    %{
      message: "user created!",
      user: user
    }
  end
end
