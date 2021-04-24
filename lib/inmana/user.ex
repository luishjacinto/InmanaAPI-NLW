defmodule Inmana.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Item

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "users" do
    field :email, :string
    field :name, :string

    has_many :items, Item

    timestamps()
  end

  def changeset(params) do
    # Inmana.User
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
