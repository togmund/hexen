defmodule Hexen.DatabaseSeeder do
  @moduledoc """
  Script for populating the database. You can run it as:

      mix run priv/repo/seeds.exs

  Inside the script, you can read and write to any of your
  repositories directly:

      Hexen.Repo.insert!(%Hexen.SomeSchema{})

  We recommend using the bang functions (`insert!`, `update!`
  and so on) as they will fail if something goes wrong.
  """
  alias Hexen.Repo
  alias Hexen.People.Band

  # Clear the database first before seeding
  Repo.delete_all(Band)
  Repo.delete_all(Users)

  # Band Seeds
  Repo.insert!(%Band{
    name: "White Boulder Warriors",
    sigil: "https://s.put.re/x6gqMaXu.png"
  })

  Repo.insert!(%Band{
    name: "Cruel Feet Clan",
    sigil: "https://s.put.re/gdm61zL7.png"
  })

  Repo.insert!(%Band{
    name: "Blue Mammoth Horde",
    sigil: "https://s.put.re/MicE3c3j.png"
  })

  # User Seeds
  Repo.insert!(%Users{
    name: "Descartes",
    avatar: "https://s.put.re/x6gqMaXu.png",
    email: "des@cartes.com"
  })

  Repo.insert!(%Users{
    name: "Rose",
    avatar: "https://s.put.re/gdm61zL7.png",
    email: "ro@se.com",
    band_id: 2
  })

  Repo.insert!(%Users{
    name: "Lizard",
    avatar: "https://s.put.re/MicE3c3j.png",
    email: "liz@ard.com",
    band_id: 2
  })

  #
end
