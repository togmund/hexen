defmodule Hexen.Repo.Migrations.AddDrawnColumnToDeckCards do
  use Ecto.Migration

  def change do
    alter table(:deck_cards) do
      add :drawn, :boolean, default: false, null: false
    end
  end
end
