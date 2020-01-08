defmodule Hexen.Users.User do
  use Ecto.Schema

  use Pow.Ecto.Schema,
    user_id_field: :email,
    password_hash_methods:
      {&Pow.Ecto.Schema.Password.pbkdf2_hash/1, &Pow.Ecto.Schema.Password.pbkdf2_verify/2},
    password_min_length: 8,
    password_max_length: 4096

  schema "users" do
    field :avatar, :string
    field :name, :string

    belongs_to :band, Hexen.People.Band

    has_many :user_quests, Hexen.Events.UserQuest
    has_many :decks, Hexen.Inventory.Deck
    has_many :hex_users, Hexen.Map.HexUser

    pow_user_fields()

    timestamps()
  end
end
