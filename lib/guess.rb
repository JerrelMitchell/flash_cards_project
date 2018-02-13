class Guess
  attr_reader :card, :response

  def initialize(guess, flash_card)
    @guess    = guess
    @card     = flash_card
    @response = flash_card.answer
  end

  def correct?
    return false unless @guess == @response
    true
  end

  def feedback
    return 'Correct!' unless @guess != @response
    'Incorrect.'
  end
end
