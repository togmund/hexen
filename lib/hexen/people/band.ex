defmodule Hexen.People.Band do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bands" do
    field :name, :string
    field :sigil, :string

    timestamps()
  end

  @doc false
  def changeset(band, attrs) do
    band
    |> cast(attrs, [:name, :sigil])
    |> validate_required([:name, :sigil])
  end
end
