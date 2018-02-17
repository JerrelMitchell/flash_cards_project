require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/deck'
require './lib/round'
require 'simplecov'
SimpleCov.start

class RoundTest < Minitest::Test
  def setup
    @card1  = Card.new('What is the capital of Alaska?', 'Juneau')
    @card2  = Card.new('What is the color of the sky?', 'Blue')
    @card3  = Card.new('What is the capital of Texas?', 'Austin')
    @card4  = Card.new('How many continents are there?', '7')
    @deck   = Deck.new([@card1, @card2, @card3, @card4])
    @round  = Round.new(@deck)
  end

  def test_rounds_exist
    assert_instance_of Round, @round
  end

  def test_there_can_be_a_round
    assert_equal [], @round.guesses
    assert_equal @card1, @round.current_card
    assert_equal 'Juneau', @round.record_guess('Juneau')
    assert_equal 1, @round.guesses.count
  end

  def test_decks_can_be_in_a_round
    assert_equal @deck, @round.deck
  end

  def test_it_can_check_a_correct_guess_in_a_round
    @round.record_guess('Juneau')
    assert_equal 1, @round.guesses.count
    assert_equal 'Correct!', @round.guesses.first.feedback
  end

  def test_it_can_check_an_incorrect_guess_in_a_round
    @round.record_guess('2')
    assert_equal 'Incorrect.', @round.guesses.last.feedback
  end

  def test_it_can_count_a_correct_guess_in_a_round
    @round.record_guess('Juneau')
    assert_equal 1, @round.number_correct
  end

  def test_it_will_not_count_incorrect_guesses_in_a_round
    @round.record_guess('2')
    assert_equal 0, @round.number_correct
  end

  def test_it_can_check_multiple_guesses_in_a_round
    @round.record_guess('Juneau')
    assert_equal 1, @round.number_correct

    @round.record_guess('2')
    assert_equal 1, @round.number_correct

    @round.record_guess('Austin')
    assert_equal 2, @round.number_correct

    @round.record_guess('7')
    assert_equal 3, @round.number_correct
  end

  def test_it_can_check_percentage_of_correct_guesses_in_a_round
    @round.record_guess('Juneau')
    @round.number_correct
    assert_equal 100, @round.percent_correct

    @round.record_guess('2')
    @round.number_correct
    assert_equal 50, @round.percent_correct

    @round.record_guess('Austin')
    @round.number_correct
    assert_equal 66, @round.percent_correct
  end
end
