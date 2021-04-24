defmodule Inmana.Items.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Item, User}

  def call do
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)
    # ADSL
    query = from item in Item,
      where:
        item.expiration_date >= ^beginning_of_week and item.expiration_date <= ^end_of_week,
        preload: [:user]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Item{user: %User{email: email}} -> email end)
  end
end
