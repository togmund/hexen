defmodule Hexen.People.Band do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bands" do
    field :name, :string
    field :sigil, :string

    has_many :users, Hexen.Users.User
    has_many :band_quests, Hexen.Events.BandQuest

    timestamps()
  end

  @doc false
  def changeset(band, attrs) do
    band
    |> cast(attrs, [:name, :sigil])
    |> validate_required([:name, :sigil])
    |> unique_constraint(:name)
  end
end
