defmodule PhoenixReactPlayground.Repo.Migrations.InitialTables do
  use Ecto.Migration

  def change do
    # People
    create table(:users) do
      add :name, :string

      timestamps()
    end

    create table(:bands) do
      add :name, :string

      timestamps()
    end

    # Decks
    create table(:decks) do
      add :name, :string

      timestamps()
    end

    create table(:deck_cards) do
      add :name, :string

      timestamps()
    end

    create table(:cards) do
      add :name, :string

      timestamps()
    end

    # Hexes
    create table(:hexes) do
      add :name, :string

      timestamps()
    end

    create table(:hex_users) do
      add :name, :string

      timestamps()
    end

    create table(:regions) do
      add :name, :string

      timestamps()
    end

    create table(:region_biomes) do
      add :name, :string

      timestamps()
    end

    create table(:biomes) do
      add :name, :string

      timestamps()
    end

    # Quests
    create table(:quests) do
      add :name, :string
      add :user_quest_id, references("user_quests")

      timestamps()
    end

    create table(:user_quests) do
      add :name, :string

      timestamps()
    end

    create table(:card_quests) do
      add :name, :string

      timestamps()
    end

    create table(:band_quests) do
      add :name, :string

      timestamps()
    end

    create table(:hex_quests) do
      add :name, :string

      timestamps()
    end

    create table(:region_quests) do
      add :name, :string

      timestamps()
    end

    create table(:biome_quests) do
      add :name, :string

      timestamps()
    end
  end
end
