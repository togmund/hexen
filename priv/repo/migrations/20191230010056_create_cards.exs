defmodule Hexen.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string
      add :description, :string
      add :suit, :string
      add :modifier, :integer
      add :image, :string
      add :material, :string

      timestamps()
    end
  end
end
