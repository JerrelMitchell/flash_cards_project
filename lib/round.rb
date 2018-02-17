# combines deck(s) and guesses framework to check that user input equals the
# answer on an individual card, and shows number/percentage of correct guesses.
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
    @guesses.find_all do |guess|
      guess.correct?
    end.count
  end

  def percent_correct
    percentage = (number_correct / @guesses.count.to_f) * 100
    percentage.to_i
  end
end
