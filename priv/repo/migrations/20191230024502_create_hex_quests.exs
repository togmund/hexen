defmodule Hexen.Repo.Migrations.CreateHexQuests do
  use Ecto.Migration

  def change do
    create table(:hex_quests) do
      add :progress, :integer
      add :hex_id, references(:hexes, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps()
    end

    create index(:hex_quests, [:hex_id])
    create index(:hex_quests, [:quest_id])
  end
end
