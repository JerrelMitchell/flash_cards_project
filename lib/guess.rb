# set up for response to a flash card.
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
