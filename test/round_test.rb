require 'minitest/autorun'
require 'minitest/pride'
require './lib/flash_cards'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau')
    @card2 = Card.new('Approximately how many miles are in
                      one astronomical unit?', '93,000,000')
    @card3 = Card.new('What is the capital of Texas?', 'Austin')
    @card4 = Card.new('How many continents are there?', '7')
    @deck  = Deck.new([@card1, @card2, @card3, @card4])
    @round = Round.new(@deck)
  end

  def test_it_can_have_rounds
    assert_equal [], @round.guesses
    assert_equal @card1, @round.current_card
    assert_equal 'Juneau', @round.record_guess('Juneau')
    assert_equal 1, @round.guesses.count
  end

  def test_it_can_check_number_of_correct_guesses
    assert_equal @card1, @round.current_card
    assert_equal 'Juneau', @round.record_guess('Juneau')
    assert_equal 1, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 1, @round.number_correct

    assert_equal @card2, @round.current_card
    assert_equal '2', @round.record_guess('2')
    assert_equal 2, @round.guesses.count
    assert_equal 'Incorrect.', @round.guesses.last.feedback
    assert_equal 1, @round.number_correct

    assert_equal @card3, @round.current_card
    assert_equal 'Austin', @round.record_guess('Austin')
    assert_equal 3, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 2, @round.number_correct

    assert_equal @card4, @round.current_card
    assert_equal '7', @round.record_guess('7')
    assert_equal 4, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 3, @round.number_correct
  end

  def test_it_can_check_percentage_of_correct_guesses
    assert_equal @card1, @round.current_card
    assert_equal 'Juneau', @round.record_guess('Juneau')
    assert_equal 1, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 1, @round.number_correct

    assert_equal @card2, @round.current_card
    assert_equal '2', @round.record_guess('2')
    assert_equal 2, @round.guesses.count
    assert_equal 'Incorrect.', @round.guesses.last.feedback
    assert_equal 1, @round.number_correct

    assert_equal @card3, @round.current_card
    assert_equal 'Austin', @round.record_guess('Austin')
    assert_equal 3, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 2, @round.number_correct

    assert_equal @card4, @round.current_card
    assert_equal '7', @round.record_guess('7')
    assert_equal 4, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.last.feedback
    assert_equal 3, @round.number_correct
    assert_equal 75, @round.percent_correct
  end
end
