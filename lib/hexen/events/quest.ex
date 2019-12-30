defmodule Hexen.Events.Quest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "quests" do
    field :description, :string
    field :name, :string
    field :requirement, :integer
    field :reward, :id

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:name, :description, :requirement])
    |> validate_required([:name, :description, :requirement])
  end
end
