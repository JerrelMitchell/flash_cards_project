require './lib/cards'
require './lib/deck'
require './lib/guess'
require './lib/round'

require 'pry'

# handles cards, deck(s), round(s), and their methods to output to terminal.
class GameRunner < Round
  def initialize
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau')
    @card2 = Card.new('What is the color of the sky?', 'Blue')
    @card3 = Card.new('What is the capital of Texas?', 'Austin')
    @deck  = Deck.new([@card1, @card2, @card3])
    @round = Round.new(@deck)
  end

  def start
    "Type 'Start' to begin a new round!"
  end

  def header
    "WELCOME! You're playing with #{@deck.count} cards.\n" \
    '_____________________________________'
  end

  def footer
    '************* Game Over! *************'
  end

  def incorrect_input
    "Sorry, I don't understand that command."
  end

  def ask_question
    "Question: #{@card1.question}"
  end

  def score
    "You had #{@round.number_correct} correct guesses out of
      #{@deck.count} for a score of #{@round.percent_correct}%."
  end

  def show_current_card
    "This is card number #{@round.guesses.count + 1} out of #{@deck.count}."
  end
end

@card1 = Card.new('What is the capital of Alaska?', 'Juneau')
@card2 = Card.new('What is the color of the sky?', 'Blue')
@card3 = Card.new('What is the capital of Texas?', 'Austin')
@deck  = Deck.new([@card1, @card2, @card3])
@round = Round.new(@deck)
game = GameRunner.new

puts game.header
puts game.start
start_command = gets.chomp.upcase

while start_command.to_s != 'START'
  puts game.incorrect_input
  start_command = gets.chomp.upcase
end

puts game.show_current_card
puts @card1.question
@round.record_guess(gets.chomp.to_s.capitalize)
puts @round.guesses.last.feedback
@round.number_correct

puts game.show_current_card
puts @card2.question
@round.record_guess(gets.chomp.to_s.capitalize)
@round.guesses.count
puts @round.guesses.last.feedback
@round.number_correct

puts game.show_current_card
puts @card3.question
@round.record_guess(gets.chomp.to_s.capitalize)
@round.guesses.count
puts @round.guesses.last.feedback
@round.number_correct

@round.percent_correct

puts game.footer
puts game.score
