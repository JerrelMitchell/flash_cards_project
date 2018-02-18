require './lib/cards'
require './lib/deck'
require './lib/guess'
require './lib/round'
require './lib/card_generator'

@filename = 'cards.txt'
@cards = CardGenerator.new(@filename).cards
@deck  = Deck.new(@cards)
@round = Round.new(@deck)

def start
  "Type 'Start' to begin a new round!"
end

def header
  "WELCOME! You're playing with #{@deck.count} cards.\n" \
  '_____________________________________'
end

def incorrect_input
  "Sorry, I don't understand that command."
end

def ask_question
  "Question: #{@round.current_card.question}"
end

def show_current_card
  "This is card number #{@round.guesses.count + 1} out of #{@deck.count}."
end

def footer_with_score
  "************* Game Over! ************* \n" \
  "You had #{@round.number_correct} correct guesses out of #{@deck.count} " \
  "for a score of #{@round.percent_correct}%."
end

puts header
puts start
start_command = gets.chomp.upcase

while start_command.to_s != 'START'
  puts incorrect_input
  start_command = gets.chomp.upcase
end

4.times do
  puts show_current_card
  puts ask_question
  @round.record_guess(gets.chomp.to_s.downcase)
  puts @round.guesses.last.feedback
  @round.number_correct
end

puts footer_with_score
