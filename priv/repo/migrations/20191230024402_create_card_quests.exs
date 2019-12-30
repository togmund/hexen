defmodule Hexen.Repo.Migrations.CreateCardQuests do
  use Ecto.Migration

  def change do
    create table(:card_quests) do
      add :progress, :integer
      add :card_id, references(:cards, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps()
    end

    create index(:card_quests, [:card_id])
    create index(:card_quests, [:quest_id])
  end
end
