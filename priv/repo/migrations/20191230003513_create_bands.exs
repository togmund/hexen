defmodule Hexen.Repo.Migrations.CreateBands do
  use Ecto.Migration

  def change do
    create table(:bands) do
      add :name, :string
      add :sigil, :string

      timestamps()
    end

    create unique_index(:bands, [:name])
  end
end
