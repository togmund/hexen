defmodule Hexen.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :name, :string
      add :description, :string
      add :requirement, :integer
      add :reward, references(:cards, on_delete: :nothing)

      timestamps()
    end

    create index(:quests, [:reward])
  end
end
