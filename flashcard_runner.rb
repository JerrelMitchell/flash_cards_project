require './lib/deck'
require './lib/flash_cards'
require './lib/guess'
require './lib/round'

class GameRunner

  def start
    "Type 'Start' to begin a new round!"
  end

  def header_welcome
    "Welcome! You're playing with #{deck.count} cards."
  end

  def header_end
    '___________________________________________'
  end

  def footer
    '********** Game Over! **********'
  end

  def ask_question
    "Question: #{current_card.question}"
  end

  def score
    "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
  end

  def show_current_card
    "This is card number #{round.} out of #{round.guesses.count}."
  end
end

puts header_welcome
puts header_end
puts start
gets.chomp.capitalize
puts show_current_card
puts ask_question
gets.chomp
puts feedback

puts footer
puts score


# card1 = Card.new('What is the capital of Alaska?', 'Juneau')
# card2 = Card.new('Approximately how many miles are in
#                   one astronomical unit?', '93,000,000')
# card3 = Card.new('Describe in words the exact direction that is 697.5°
#                   clockwise from due north?', 'North north west')
# deck  = Deck.new([card1, card2, card3])
# round = Round.new(deck)
#
# # assert_equal 'Juneau', round.record_guess('Juneau')
# # assert_equal 1, round.guesses.count
# # assert_equal 'Correct!', round.guesses.first.feedback
# # assert_equal '2', round.record_guess('2')
# # assert_equal 2, round.guesses.count
# # assert_equal 'Incorrect.', round.guesses.last.feedback
# # assert_equal 1, round.number_correct
# # assert_equal 50, round.percent_correct
