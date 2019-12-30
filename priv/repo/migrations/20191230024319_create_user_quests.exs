defmodule Hexen.Repo.Migrations.CreateUserQuests do
  use Ecto.Migration

  def change do
    create table(:user_quests) do
      add :progress, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps()
    end

    create index(:user_quests, [:user_id])
    create index(:user_quests, [:quest_id])
  end
end
