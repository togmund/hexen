defmodule Hexen.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :name, :string
      add :description, :string
      add :requirement, :integer
      add :card_id, references(:cards, on_delete: :nothing)

      timestamps()
    end

    create index(:quests, [:card_id])
  end
end
