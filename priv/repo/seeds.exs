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
    name: "FezJab",
    resource: "Silver",
    region_id: 1,
    biome_id: 1,
    controlled_by: 1
  })

  Repo.insert!(%Hex{
    name: "VoxJay",
    resource: "Softwood",
    region_id: 2,
    biome_id: 2,
    controlled_by: 2
  })

  Repo.insert!(%Hex{
    name: "MixZen",
    resource: "Iron",
    structure: "Mine",
    region_id: 3,
    biome_id: 3,
    controlled_by: 3
  })

  # Hex_User Seeds
  Repo.insert!(%HexUser{
    hex_id: 1,
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
    name: "Halberd",
    suit: "Combat",
    description: "Plus one damage.",
    image: "https://forums.terraria.org/index.php?attachments/halberd-png.184946/",
    modifier: 1
  })

  Repo.insert!(%Card{
    name: "Long Haul Boots",
    suit: "Move",
    description: "Travel two hexes instead of one.",
    image: "http://pixelartmaker.com/art/920bb2ea34df485.png",
    modifier: 2
  })

  Repo.insert!(%Card{
    name: "Pickaxe",
    suit: "Gather",
    description: "Triple haul on ore resources.",
    image: "http://pixelartmaker.com/art/16c8f43e143cb6d.png",
    modifier: 3
  })

  Repo.insert!(%Card{
    name: "Spyglass",
    suit: "Explore",
    description: "See resources in one layer of fog of war.",
    image: "https://image.flaticon.com/icons/svg/486/486425.svg",
    modifier: 1
  })

  Repo.insert!(%Card{
    name: "Cart",
    suit: "Interact",
    description: "Bundle two cards for a trade.",
    image: "https://i.redd.it/79iyl3f4zhf31.png",
    modifier: 2
  })

  Repo.insert!(%Card{
    name: "Anvil",
    suit: "Craft",
    description: "Extra bonus on crafted weapons.",
    image: "http://pixelartmaker.com/art/9cf72f5b79c4946.png",
    modifier: 3
  })

  # Deck
  Repo.insert!(%Deck{
    name: "Warrior",
    cardback:
      "https://images.squarespace-cdn.com/content/v1/55412d53e4b0528e612ddc1c/1523280516666-W4RT9AXL3K3S72OIT1H7/ke17ZwdGBToddI8pDm48kK8JYRz-fDku-1kxOzVBow1Zw-zPPgdn4jUwVcJE1ZvWhcwhEtWJXoshNdA9f1qD7dso8WS9HrXe-DDzLfr_qHkfLXs0Ydz0Nw06aYWpDc0BK7RUaNg3Kw5cjOyG5RYcYQ/Card+-+Imago+v2s.png?format=300w",
    user_id: 1
  })

  Repo.insert!(%Deck{
    name: "Hustler",
    cardback:
      "https://images.squarespace-cdn.com/content/v1/55412d53e4b0528e612ddc1c/1501377253824-RNGJD3KBQIBVBGVFVYF6/ke17ZwdGBToddI8pDm48kK8JYRz-fDku-1kxOzVBow1Zw-zPPgdn4jUwVcJE1ZvWhcwhEtWJXoshNdA9f1qD7dso8WS9HrXe-DDzLfr_qHkfLXs0Ydz0Nw06aYWpDc0BK7RUaNg3Kw5cjOyG5RYcYQ/image-asset.png?format=300w",
    user_id: 2
  })

  Repo.insert!(%Deck{
    name: "Farmer",
    cardback:
      "https://images.squarespace-cdn.com/content/v1/55412d53e4b0528e612ddc1c/1548813989423-ZMQXHTQAHLWXL8WTVPAB/ke17ZwdGBToddI8pDm48kHH_Ry-AleYJxFEQnPBTZXlZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVGbz8tGYbwDesJWqE1_XARn6Mnfqr_41RxQUYxW4tXmCGbSd6kfRtgWHgNMDgGnmDY/image-asset.png?format=300w",
    user_id: 3
  })

  # Deck
  Repo.insert!(%DeckCard{
    deck_id: 1,
    card_id: 1
  })

  Repo.insert!(%DeckCard{
    deck_id: 2,
    card_id: 2
  })

  Repo.insert!(%DeckCard{
    deck_id: 3,
    card_id: 3
  })

  # Quest Seeds
  Repo.insert!(%Quest{
    name: "Visit",
    description: "",
    requirement: 4,
    reward: 1
  })

  Repo.insert!(%Quest{
    name: "Visit",
    description: "",
    requirement: 5,
    reward: 2
  })

  Repo.insert!(%Quest{
    name: "Visit",
    description: "",
    requirement: 6,
    reward: 3
  })

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
  Repo.insert!(%HexQuest{
    progress: 1,
    user_id: 1,
    quest_id: 1
  })

  Repo.insert!(%HexQuest{
    progress: 2,
    user_id: 2,
    quest_id: 2
  })

  Repo.insert!(%HexQuest{
    progress: 3,
    user_id: 3,
    quest_id: 3
  })

  # Card_Quest Seeds
  Repo.insert!(%CardQuest{
    progress: 1,
    user_id: 1,
    quest_id: 1
  })

  Repo.insert!(%CardQuest{
    progress: 2,
    user_id: 2,
    quest_id: 2
  })

  Repo.insert!(%CardQuest{
    progress: 3,
    user_id: 3,
    quest_id: 3
  })

  # Band_Quest Seeds
  Repo.insert!(%BandQuest{
    progress: 1,
    user_id: 1,
    quest_id: 1
  })

  Repo.insert!(%BandQuest{
    progress: 2,
    user_id: 2,
    quest_id: 2
  })

  Repo.insert!(%BandQuest{
    progress: 3,
    user_id: 3,
    quest_id: 3
  })
end
