defmodule PhoenixReactPlayground.DatabaseSeeder do
  @moduledoc """
  Script for populating the database. You can run it as:

      mix run priv/repo/seeds.exs

  Inside the script, you can read and write to any of your
  repositories directly:

      PhoenixReactPlayground.Repo.insert!(%PhoenixReactPlayground.SomeSchema{})

  We recommend using the bang functions (`insert!`, `update!`
  and so on) as they will fail if something goes wrong.
  """
  alias PhoenixReactPlayground.Repo
  alias PhoenixReactPlayground.Example.Language

  # Clear the database first before seeding
  Repo.delete_all(Bands)
  Repo.delete_all(Users)

  # Band Seeds
  Repo.insert!(%Bands{
    name: "White Boulder Warriors",
    sigil: "https://s.put.re/x6gqMaXu.png"
  })

  Repo.insert!(%Bands{
    name: "Cruel Feet Clan",
    sigil: "https://s.put.re/gdm61zL7.png"
  })

  Repo.insert!(%Bands{
    name: "Blue Mammoth Horde",
    sigil: "https://s.put.re/MicE3c3j.png"
  })

  # User Seeds
  Repo.insert!(%Users{
    name: "White Boulder Warriors",
    sigil: "https://s.put.re/x6gqMaXu.png"
  })

  Repo.insert!(%Users{
    name: "Cruel Feet Clan",
    sigil: "https://s.put.re/gdm61zL7.png"
  })

  Repo.insert!(%Users{
    name: "Blue Mammoth Horde",
    sigil: "https://s.put.re/MicE3c3j.png"
  })

  #
end
