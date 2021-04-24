defmodule InmanaWeb.UsersViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.UsersView
  alias Inmana.User

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Luis Test", email: "luisTest@test.com"}

      {:ok, user} = Inmana.create_user(params)

      response = render(UsersView, "create.json", user: user)

      assert %{
                message: "user created!",
                user: %User{
                  email: "luisTest@test.com",
                  id: _id,
                  inserted_at: _inserted_at
                }
              } = response
    end

  end

end
