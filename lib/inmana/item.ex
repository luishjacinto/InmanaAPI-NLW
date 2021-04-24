defmodule Inmana.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :quantity, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :description, :string
    field :expiration_date, :date
    field :quantity, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_number(:quantity, greater_than: 0)
    |> validate_expiration_date()
  end

  defp validate_expiration_date(changeset) do
    validate_change(changeset, :expiration_date, fn _, expiration_date ->
      case Date.compare(expiration_date, Date.utc_today()) do
        :gt -> []
        :eq -> []
        :lt -> [{:expiration_date, "expiration date must be equal or greater than today"}]
      end
    end)
  end
end
