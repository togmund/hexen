defmodule Hexen.Repo.Migrations.AddHexCoordinates do
  use Ecto.Migration

  def change do
    alter table(:hexes) do
      add :q, :integer
      add :r, :integer
      add :s, :integer
    end
  end
end
