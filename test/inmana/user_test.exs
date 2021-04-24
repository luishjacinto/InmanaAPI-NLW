defmodule Inmana.UserTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Luis Test", email: "luisTest@test.com"}

      response = User.changeset(params)

      assert %Changeset{
          changes: %{
            name: "Luis Test",
            email: "luisTest@test.com"
          },
          valid?: true
        } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "L", email: ""}
      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = User.changeset(params)

      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_response
    end
  end
end
