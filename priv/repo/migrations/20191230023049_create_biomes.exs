defmodule Hexen.Repo.Migrations.CreateBiomes do
  use Ecto.Migration

  def change do
    create table(:biomes) do
      add :name, :string
      add :resource, :string

      timestamps()
    end

    create unique_index(:biomes, [:name])
  end
end
