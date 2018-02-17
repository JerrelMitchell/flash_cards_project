# set up for user input response to a card's question.
class Guess
  attr_reader :card, :response

  def initialize(guess, card)
    @guess    = guess
    @card     = card
    @response = card.answer
  end

  def correct?
    @guess == @response
  end

  def feedback
    return 'Correct!' if correct?
    'Incorrect.'
  end
end
