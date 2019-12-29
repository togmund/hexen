defmodule HexenInitialTables do
  use Ecto.Migration

  def change do
    # People
    create table(:bands) do
      add(:name, :string)
      add(:sigil, :string)

      timestamps()
    end

    create table(:users) do
      add(:band_id, references("bands"))

      add(:name, :string)
      add(:avatar, :string)
      add(:email, :string)

      timestamps()
    end

    # Decks
    create table(:decks) do
      add(:name, :string)
      add(:cardback, :string)

      timestamps()
    end

    create table(:cards) do
      add(:name, :string)
      add(:description, :string)
      add(:suit, :string)
      add(:modifier, :integer)
      add(:image, :string)

      timestamps()
    end

    create table(:deck_cards) do
      add(:deck_id, references("decks"))
      add(:card_id, references("cards"))

      add(:name, :string)

      timestamps()
    end

    # Hexes
    create table(:regions) do
      add(:name, :string)

      timestamps()
    end

    create table(:biomes) do
      add(:name, :string)
      add(:resource, :string)

      timestamps()
    end

    create table(:hexes) do
      add(:region_id, references("regions"))
      add(:biome_id, references("biomes"))
      add(:controlled_by, references("bands"))

      add(:name, :string)
      add(:upgrade, :string)

      timestamps()
    end

    create table(:hex_users) do
      add(:hex_id, references("hexes"))
      add(:user_id, references("users"))

      add(:name, :string)
      add(:left_at, :naive_datetime)

      timestamps()
    end

    # Quests
    create table(:quests) do
      add(:name, :string)
      add(:description, :string)
      add(:requirement, :integer)

      timestamps()
    end

    create table(:user_quests) do
      add(:user_id, references("users"))
      add(:quest_id, references("quests"))
      add(:progress, :integer)

      add(:name, :string)

      timestamps()
    end

    create table(:card_quests) do
      add(:card_id, references("cards"))
      add(:quest_id, references("quests"))
      add(:progress, :integer)

      add(:name, :string)

      timestamps()
    end

    create table(:band_quests) do
      add(:band_id, references("bands"))
      add(:quest_id, references("quests"))
      add(:progress, :integer)

      add(:name, :string)

      timestamps()
    end

    create table(:hex_quests) do
      add(:hex_id, references("hexes"))
      add(:quest_id, references("quests"))
      add(:progress, :integer)

      add(:name, :string)

      timestamps()
    end
  end
end
