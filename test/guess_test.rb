require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @card1  = Card.new('What is the capital of Alaska?', 'Juneau')
    @card2  = Card.new('Which planet is closest to the sun?', 'Mercury')
    @guess1 = Guess.new('Juneau', @card1)
    @guess2 = Guess.new('Saturn', @card2)
  end

  def test_guess_exists
    assert_instance_of Guess, @guess1
  end

  def test_correct_guess_has_a_card
    assert_equal @card1, @guess1.card
  end

  def test_it_can_check_a_correct_guess
    assert_equal 'Juneau', @guess1.response
    assert @guess1.correct?
    assert_equal 'Correct!', @guess1.feedback
  end

  def test_wrong_guess_has_a_card
    assert_equal @card2, @guess2.card
  end

  def test_it_can_check_a_wrong_guess
    refute_equal 'Saturn', @guess2.response
    refute @guess2.correct?
    assert_equal 'Incorrect.', @guess2.feedback
  end
end
