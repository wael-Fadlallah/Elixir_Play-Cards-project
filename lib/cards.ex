defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  def create_deck do
    values = ["Ace", "two", "Three", "Four", "Five"]
    suits  = ["Spades", "Clubs", "Hearts", "Dimonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck,card) do
    Enum.member?(deck,card)
  end

  def deal(deck,hand_size) do
    Enum.split(deck,hand_size)
  end

  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load() do
    case File.read("files") do
      {:ok,binary} -> :erlang.binary_to_term(binary)
      {:error,_resoan} -> "error in laod the file"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck,hand_size)
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)

  end
end
