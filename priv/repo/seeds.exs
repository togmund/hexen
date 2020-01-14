defmodule Hexen.DatabaseSeeder do
  @moduledoc """
  Script for populating the database. You can run it as:

  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
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

  Repo.delete_all(UserQuest)
  Repo.delete_all(BandQuest)
  Repo.delete_all(CardQuest)
  Repo.delete_all(HexQuest)
  Repo.delete_all(Quest)

  Repo.delete_all(DeckCard)
  Repo.delete_all(Card)
  Repo.delete_all(Deck)

  Repo.delete_all(HexUser)
  Repo.delete_all(Hex)
  Repo.delete_all(Biome)
  Repo.delete_all(Region)

  Repo.delete_all(User)
  Repo.delete_all(Band)

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
    resource: "Silver",
    image: "https://i.ibb.co/F7kbcFh/snow-resize.png"
  })

  Repo.insert!(%Biome{
    name: "Taiga",
    resource: "Softwood",
    image: "https://i.ibb.co/WWFQDhJ/purple-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Mountain",
    resource: "Iron",
    image: "https://i.ibb.co/P4tK7xx/mountain-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Woodland",
    resource: "Hardwood",
    image: "https://i.ibb.co/t8NgLbQ/grassland-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Grassland",
    resource: "Wheat",
    image: "https://i.ibb.co/VmYLRTB/grass-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Chaparral",
    resource: "Gold",
    image: "https://i.ibb.co/h1j86hg/hex1-rotated.png"
  })

  Repo.insert!(%Biome{
    name: "Savanna",
    resource: "Leather",
    image: "https://i.ibb.co/MVW4XfV/orange-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Fen",
    resource: "Fur",
    image: "https://i.ibb.co/S34xwsx/swamp-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Desert",
    resource: "Glass",
    image: "https://i.ibb.co/RHsVg4m/dunes-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Tropic",
    resource: "Fruit",
    image: "https://i.ibb.co/842VhsT/river-rotate.png"
  })

  Repo.insert!(%Biome{
    name: "Ocean",
    resource: "Fish",
    image: "https://i.ibb.co/tzRxjH5/ocean-rotate.png"
  })

  # Hex seeds
  rows = 25
  long_col = 25

  resources = [
    "Silver",
    "Softwood",
    "Iron",
    "Hardwood",
    "Wheat",
    "Gold",
    "Leather",
    "Fur",
    "Glass",
    "Fruit",
    "Fish"
  ]

  # Quirk of react-hexgrid package: r == z and s == y if we follow https://www.redblobgames.com/grids/hexagons/
  Enum.each(0..rows, fn x ->
    top =
      if rem(x, 2) == 0 do
        %{q: x, r: -trunc(x / 2), s: -trunc(x / 2)}
      else
        %{q: x, r: -trunc(Float.ceil(x / 2, 0)), s: -trunc(Float.floor(x / 2, 0))}
      end

    Enum.each(0..long_col, fn y ->
      Repo.insert!(%Hex{
        structure: "Castle",
        resource: Enum.random(resources),
        biome_id: Enum.random(1..11),
        region_id: Enum.random(1..3),
        q: top[:q],
        r: top[:r] + y,
        s: top[:s] - y
      })
    end)
  end)

  # Hex_User Seeds
  Repo.insert!(%HexUser{
    hex_id: 291,
    user_id: 1
  })

  Repo.insert!(%HexUser{
    hex_id: 2,
    user_id: 2
  })

  Repo.insert!(%HexUser{
    hex_id: 3,
    user_id: 3
  })

  # Card

  Repo.insert!(%Card{
    name: "Rest",
    suit: "Rest",
    description: "Take a moment, catch your breath.",
    image: "https://i.ibb.co/JmRTqB0/Zk-D80aw-8x.png"
  })

  Repo.insert!(%Card{
    name: "Sword",
    suit: "Combat",
    description: "Deals three physical damage",
    image: "https://i.ibb.co/xspKdvw/c4oui-Ug-8x.png",
    modifier: 3
  })

  Repo.insert!(%Card{
    name: "Boots",
    suit: "Move",
    description: "Travel two hexes instead of one.",
    image: "https://i.ibb.co/DrgyDXG/ex3-Qkkr-8x.png",
    modifier: 2
  })

  Repo.insert!(%Card{
    name: "Axe",
    suit: "Gather",
    description: "Triple haul on wood resources.",
    image: "https://i.ibb.co/cTYqfyf/RV5-GWF8-8x.png",
    modifier: 3
  })

  Repo.insert!(%Card{
    name: "Map",
    suit: "Explore",
    description: "See nearby quest markers.",
    image: "https://i.ibb.co/ngC8G2d/Lde-Txc2-8x.png",
    modifier: 1
  })

  Repo.insert!(%Card{
    name: "Pie",
    suit: "Interact",
    description: "Share a pie with a friend.",
    image: "https://i.ibb.co/JB5HjBd/Gga5-WIi-8x.png",
    modifier: 3
  })

  resources
  |> Enum.each(fn mat ->
    Repo.insert!(%Card{
      name: "Elixir",
      suit: "Craft",
      description: "Concoct an elixir.",
      image: "https://i.ibb.co/cQMbv3Q/4g7-ITMF-8x.png",
      modifier: 2,
      material: mat
    })
  end)

  cardbacks = [
    "https://i.ibb.co/27hKNkK/u78w-C4o-4x.png",
    "https://i.ibb.co/NL9fXjP/64-Ko-DTn-4x.png",
    "https://i.ibb.co/j3ZPDBp/rp-Bl-OXG-4x.png",
    "https://i.ibb.co/0qNLgrn/7qzjt-PS-4x.png",
    "https://i.ibb.co/HPscynX/Kz-SOs-VR-4x.png"
  ]

  # Deck
  Repo.insert!(%Deck{
    name: "Warrior",
    cardback: Enum.random(cardbacks),
    user_id: 1
  })

  Repo.insert!(%Deck{
    name: "Hustler",
    cardback: Enum.random(cardbacks),
    user_id: 2
  })

  Repo.insert!(%Deck{
    name: "Farmer",
    cardback: Enum.random(cardbacks),
    user_id: 3
  })

  # Decks
  Enum.each(1..35, fn _x ->
    Repo.insert!(%DeckCard{
      deck_id: 1,
      card_id: Enum.random(2..16),
      drawn: false
    })
  end)

  Enum.each(1..35, fn _x ->
    Repo.insert!(%DeckCard{
      deck_id: 2,
      card_id: Enum.random(2..16),
      drawn: false
    })
  end)

  Enum.each(1..35, fn _x ->
    Repo.insert!(%DeckCard{
      deck_id: 3,
      card_id: Enum.random(2..16),
      drawn: false
    })
  end)

  # Quest Seeds
  names = [
    "belong",
    "Sunday",
    "desert",
    "arrest",
    "tiptoe",
    "favour",
    "salmon",
    "remark",
    "castle",
    "accept",
    "blonde",
    "leader",
    "pierce",
    "shadow",
    "switch",
    "grudge",
    "sister",
    "design",
    "strong",
    "safety",
    "doctor",
    "market",
    "couple",
    "script",
    "stable",
    "decide",
    "sermon",
    "assume",
    "camera",
    "winter",
    "return",
    "border",
    "twitch",
    "nature",
    "candle",
    "jockey",
    "sodium",
    "circle",
    "cheque",
    "reform",
    "battle",
    "driver",
    "notice",
    "sample",
    "marble",
    "visual",
    "effect",
    "desire",
    "deport"
  ]

  1..700
  |> Enum.each(fn _num ->
    Repo.insert!(%Quest{
      name: Enum.random(names),
      description: "",
      requirement: 100,
      card_id: 2
    })
  end)

  # User_Quest Seeds
  Repo.insert!(%UserQuest{
    progress: 1,
    user_id: 1,
    quest_id: 1
  })

  Repo.insert!(%UserQuest{
    progress: 2,
    user_id: 2,
    quest_id: 2
  })

  Repo.insert!(%UserQuest{
    progress: 3,
    user_id: 3,
    quest_id: 3
  })

  # Hex_Quest Seeds
  1..250
  |> Enum.each(fn num ->
    Repo.insert!(%HexQuest{
      progress: 1,
      hex_id: num,
      quest_id: Enum.random(1..700)
    })
  end)

  # Card_Quest Seeds
  Repo.insert!(%CardQuest{
    progress: 1,
    card_id: 1,
    quest_id: 1
  })

  Repo.insert!(%CardQuest{
    progress: 2,
    card_id: 2,
    quest_id: 2
  })

  Repo.insert!(%CardQuest{
    progress: 3,
    card_id: 3,
    quest_id: 3
  })

  # Band_Quest Seeds
  Repo.insert!(%BandQuest{
    progress: 1,
    band_id: 1,
    quest_id: 1
  })

  Repo.insert!(%BandQuest{
    progress: 2,
    band_id: 2,
    quest_id: 2
  })

  Repo.insert!(%BandQuest{
    progress: 3,
    band_id: 3,
    quest_id: 3
  })
end
