defmodule Hexen.Events.UserQuest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_quests" do
    field :progress, :integer
    belongs_to :user, Hexen.People.User
    belongs_to :quest, Hexen.Events.Quest

    timestamps()
  end

  @doc false
  def changeset(user_quest, attrs) do
    user_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
