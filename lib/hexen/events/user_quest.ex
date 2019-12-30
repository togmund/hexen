defmodule Hexen.Events.UserQuest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_quests" do
    field :progress, :integer
    field :user_id, :id
    field :quest_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_quest, attrs) do
    user_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
