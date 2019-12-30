defmodule Hexen.Repo.Migrations.CreateDeckCards do
  use Ecto.Migration

  def change do
    create table(:deck_cards) do
      add :deck_id, references(:decks, on_delete: :nothing)
      add :card_id, references(:cards, on_delete: :nothing)

      timestamps()
    end

    create index(:deck_cards, [:deck_id])
    create index(:deck_cards, [:card_id])
  end
end
