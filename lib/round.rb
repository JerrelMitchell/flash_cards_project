require 'pry'
class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guess_count = 0
    @guesses = []
    # binding.pry
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(guess)
    @guess_count += 1
    guesses << guess
  end

end
