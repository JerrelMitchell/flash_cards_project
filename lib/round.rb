require 'pry'

# set up for number of correct and incorrect guesses for a deck of flashcards.
class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[guesses.length]
  end

  def record_guess(guess)
    @guesses << Guess.new(guess, current_card)
    guess
  end

  def number_correct
    inputs = guesses.map do |guess|
      guess.correct?
    end
    @correct = inputs.find_all do |input|
      input == true
    end
    @correct.count
  end

  def percent_correct
    quotient = @correct.count / @guesses.count.to_f
    percentage = quotient * 100
    percentage.to_i
  end
end
