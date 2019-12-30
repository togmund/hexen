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
  alias Hexen.People.User

  alias Hexen.Map.Region
  alias Hexen.Map.Biome
  alias Hexen.Map.Hex
  alias Hexen.Map.HexUser

  alias Hexen.Inventory.Deck
  alias Hexen.Inventory.Card
  alias Hexen.Inventory.DeckCard

  alias Hexen.Events.Quest
  alias Hexen.Events.UserQuest
  alias Hexen.Events.BandQuest
  alias Hexen.Events.CardQuest
  alias Hexen.Events.HexQuest

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
  Repo.insert!(%User{
    name: "Descartes",
    avatar: "https://s.put.re/webPTZy3.png",
    email: "des@cartes.com"
  })

  Repo.insert!(%User{
    name: "Rose",
    avatar: "https://s.put.re/1hke8Go7.png",
    email: "ro@se.com",
    band_id: 2
  })

  Repo.insert!(%User{
    name: "Lizard",
    avatar: "https://s.put.re/rodszvu3.png",
    email: "liz@ard.com",
    band_id: 2
  })

  # Region Seeds
  Repo.insert!(%Region{
    name: "Agrington"
  })

  Repo.insert!(%Region{
    name: "Ustrait"
  })

  Repo.insert!(%Region{
    name: "Tosnos"
  })

  # Biome Seeds
  Repo.insert!(%Biome{
    name: "Tundra",
    resource: "Silver"
  })

  Repo.insert!(%Biome{
    name: "Taiga",
    resource: "Softwood"
  })

  Repo.insert!(%Biome{
    name: "Mountain",
    resource: "Iron"
  })

  Repo.insert!(%Biome{
    name: "Woodland",
    resource: "Hardwood"
  })

  Repo.insert!(%Biome{
    name: "Grassland",
    resource: "Wheat"
  })

  Repo.insert!(%Biome{
    name: "Chaparral",
    resource: "Gold"
  })

  Repo.insert!(%Biome{
    name: "Savanna",
    resource: "Leather"
  })

  Repo.insert!(%Biome{
    name: "Fen",
    resource: "Fur"
  })

  Repo.insert!(%Biome{
    name: "Desert",
    resource: "Glass"
  })

  Repo.insert!(%Biome{
    name: "Tropic",
    resource: "Fruit"
  })

  # Hex Seeds
  Repo.insert!(%Hex{
    name: "FezJab"
    resource: "Silver"
    region_id: 1
    biome_id: 1
    controlled_by: 1
  })

  Repo.insert!(%Hex{
    name: "VoxJay"
    resource: "Softwood"
    region_id: 2
    biome_id: 2
    controlled_by: 2
  })

  Repo.insert!(%Hex{
    name: "MixZen"
    resource: "Iron"
    structure: "Mine"
    region_id: 3
    biome_id: 3
    controlled_by: 3
  })
end
