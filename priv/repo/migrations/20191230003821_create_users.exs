defmodule Hexen.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :avatar, :string
      add :band_id, references(:bands, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users, [:name])
    create unique_index(:users, [:email])
    create index(:users, [:band_id])
  end
end
