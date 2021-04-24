defmodule InmanaWeb.UsersControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = %{name: "Luis Test", email: "luisTest@test.com"}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
                "message" => "user created!",
                "user" => %{
                  "email" => "luisTest@test.com",
                  "id" => _id,
                  "name" => "Luis Test"
                  }
              } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "luisTest@test.com"}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
                "message" => %{
                  "name" => ["can't be blank"]
                }
              } = response
    end
  end
end
