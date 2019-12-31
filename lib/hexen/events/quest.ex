defmodule Hexen.Events.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quests" do
    field :description, :string
    field :name, :string
    field :requirement, :integer
    belongs_to :card, Hexen.Inventory.Card

    has_many :band_quests, Hexen.Events.BandQuest
    has_many :card_quests, Hexen.Events.CardQuest
    has_many :hex_quests, Hexen.Events.HexQuest
    has_many :user_quests, Hexen.Events.UserQuest

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:name, :description, :requirement])
    |> validate_required([:name, :description, :requirement])
  end
end
