class Guess
  attr_reader :card, :response

  def initialize(guess, flash_card)
    @guess    = guess
    @card     = flash_card
    @response = flash_card.answer
  end

  def correct?
    @guess == @response
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
