require 'pry'
class Round
  attr_reader :deck, :guesses

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
    decisions = guesses.map do |guess|
      guess.correct?
    end
    @correct = decisions.find_all do |decision|
      decision == true
    end
    @correct.count
  end

  def percent_correct
    quotient = @correct.count.to_f / @guesses.count.to_f
    percentage = quotient * 100
    percentage.to_i
  end
end
