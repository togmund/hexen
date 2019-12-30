defmodule Hexen.Repo.Migrations.CreateHexUsers do
  use Ecto.Migration

  def change do
    create table(:hex_users) do
      add :departed, :naive_datetime
      add :hex_id, references(:hexes, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:hex_users, [:hex_id])
    create index(:hex_users, [:user_id])
  end
end
