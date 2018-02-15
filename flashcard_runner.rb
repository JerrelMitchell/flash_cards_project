require './lib/flash_cards'
require './lib/deck'
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
    @deck  = Deck.new([@card1, @card2, @card3])
    @guess = Guess.new(@deck, @card1)
    @round = Round.new(@deck)
  end

  def start
    start_message = "Type 'Start' to begin a new round!"
    start_message
  end

  def header
    header_message = "WELCOME! You're playing with #{@deck.count} cards.\n"
    header_boarder = '_____________________________________'
    header_message + header_boarder
  end

  def footer
    '************* Game Over! *************'
  end

  def incorrect_input
    "Sorry, I don't understand that command."
  end

  def ask_question
    "Question: #{@current_card.question}"
  end

  def score
    score_message = "You had #{@round.number_correct} correct guesses out of
                     #{@deck.count} for a score of #{@round.percent_correct}%."
    score_message
  end

  def show_current_card
    "This is card number #{@round.guesses.count} out of #{@deck.count}."
  end
end

game = GameRunner.new

puts game.header
puts game.start
start_command = gets.chomp.upcase

while start_command.to_s != 'START'
  puts game.incorrect_input
  start_command = gets.chomp.upcase
end
# puts game.show_current_card
# puts game.ask_question
# guess = gets.chomp
# puts game.feedback
#
# puts footer
# puts score
#
# round.record_guess(gets.chomp)
# round.guesses.count
# puts round.guesses.first.feedback
# round.record_guess(gets.chomp)
# round.guesses.count
# puts round.guesses.last.feedback
# round.number_correct
# round.percent_correct
