defmodule Hexen.Repo.Migrations.CreateBandQuests do
  use Ecto.Migration

  def change do
    create table(:band_quests) do
      add :progress, :integer
      add :band_id, references(:bands, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps()
    end

    create index(:band_quests, [:band_id])
    create index(:band_quests, [:quest_id])
  end
end
