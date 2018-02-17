# set up for multiple cards to be stored in an array called a deck.
class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.count
  end
end
