require 'pry'
class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    # binding.pry
  end

  def current_card
    @deck.cards[guesses.length]
  end

  def record_guess(guess)
    @guesses << Guess.new(guess, current_card)
    guess
  end

  def number_correct
    if record_guess(guess) == Guess.new(guess, current_card).answer
      @guess_count += 1
    else
      @guess_count + 0
    end
  end

  # def percent_correct
  # end
end
