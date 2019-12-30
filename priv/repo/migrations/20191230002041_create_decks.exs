defmodule Hexen.Repo.Migrations.CreateDecks do
  use Ecto.Migration

  def change do
    create table(:decks) do
      add :name, :string
      add :cardback, :string

      timestamps()
    end

  end
end
