defmodule Inmana.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :description, :string
      add :expiration_date, :date
      add :quantity, :integer
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
