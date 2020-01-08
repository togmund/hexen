defmodule Hexen.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string
      add :avatar, :string
      add :band_id, references(:bands, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:name])
    create index(:users, [:band_id])
  end
end
