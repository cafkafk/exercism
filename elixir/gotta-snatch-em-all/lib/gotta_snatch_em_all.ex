defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    already_has = MapSet.member?(collection, their_card)
    no_card_to_trade = !MapSet.member?(collection, your_card)

    {already_has && no_card_to_trade,
     MapSet.put(MapSet.delete(collection, your_card), their_card)}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    MapSet.to_list(MapSet.new(cards))
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    length(
      MapSet.to_list(MapSet.difference(MapSet.new(your_collection), MapSet.new(their_collection)))
    )
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards(collections) do
    MapSet.to_list(MapSet.intersection(collections))
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    Enum.reduce(collections, MapSet.new(), fn current_collection, acc ->
      MapSet.union(acc, current_collection)
    end)
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny, normal} =
      Enum.reduce(collection, {[], []}, fn card, {shiny, normal} ->
        if String.starts_with?(card, "Shiny ") do
          {[card | shiny], normal}
        else
          {shiny, [card | normal]}
        end
      end)

    {Enum.sort(shiny), Enum.sort(normal)}
  end
end
