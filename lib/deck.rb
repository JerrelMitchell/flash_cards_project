class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards.to_a
    @count = cards.count
  end
end
