require './lib/deck'
require './lib/flash_cards'
require './lib/guess'
require './lib/round'

require 'pry'

class GameRunner
  def initialize
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau')
    @card2 = Card.new('Approximately how many miles are in
                      one astronomical unit?', '93,000,000')
    @card3 = Card.new('Describe in words the exact direction that is 697.5°
                      clockwise from due north?', 'North north west')
    @deck  = Deck.new([card1, card2, card3])
    @round = Round.new(deck)
  end

  def start
    "Type 'Start' to begin a new round!"
  end

  def header_welcome
    header_message = "Welcome! You're playing with #{deck.count} cards.\n
                      _________________________________________________"
    header_message
  end

  def footer
    '********** Game Over! **********'
  end

  def ask_question
    "Question: #{current_card.question}"
  end

  def score
    score_message = "You had #{round.number_correct} correct guesses out of
                     #{deck.count} for a score of #{round.percent_correct}%."
    score_message
  end

  def show_current_card
    "This is card number #{round.guesses.count} out of #{deck.count}."
  end
end

game = GameRunner.new

puts game.header_welcome
puts game.header_end
puts start
gets.chomp.capitalize
puts show_current_card
puts ask_question
gets.chomp
puts feedback

puts footer
puts score

round.record_guess(gets.chomp)
round.guesses.count
puts round.guesses.first.feedback
round.record_guess(gets.chomp)
round.guesses.count
puts round.guesses.last.feedback
round.number_correct
round.percent_correct
