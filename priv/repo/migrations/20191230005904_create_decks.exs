defmodule Hexen.Repo.Migrations.CreateDecks do
  use Ecto.Migration

  def change do
    create table(:decks) do
      add :name, :string
      add :cardback, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:decks, [:user_id])
  end
end
