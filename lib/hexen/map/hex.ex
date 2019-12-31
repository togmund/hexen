defmodule Hexen.Map.Hex do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hexes" do
    field :name, :string
    field :resource, :string
    field :structure, :string

    belongs_to :region, Hexen.Map.Region
    belongs_to :biome, Hexen.Map.Biome
    belongs_to :band, Hexen.People.Band

    has_many :hex_users, Hexen.Map.HexUser

    timestamps()
  end

  @doc false
  def changeset(hex, attrs) do
    hex
    |> cast(attrs, [:name, :structure, :resource])
    |> validate_required([:name, :structure, :resource])
    |> unique_constraint(:name)
  end
end
