require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/card_generator'
SimpleCov.start

class CardGeneratorTest < Minitest::Test
  def setup
    @filename = 'cards.txt'
    @cards = CardGenerator.new(@filename).cards
  end

  def test_it_exists
    assert CardGenerator, @cards
  end

  def test_it_initializes_with_array
    assert_instance_of Array, @cards
  end

  def test_it_reads_a_file_question
    assert_equal 'What is 5 + 5?', @cards[0].question
  end

  def test_it_reads_a_file_answer
    assert_equal '10', @cards[0].answer
  end

  def test_it_reads_multiple_questions_from_file
    assert_equal "What is Rachel's favorite animal?",      @cards[1].question
    assert_equal "What is Mike's middle name?",            @cards[2].question
    assert_equal 'What cardboard cutout lives at Turing?', @cards[3].question
  end

  def test_it_reads_multiple_answers_from_file
    assert_equal 'red panda',     @cards[1].answer
    assert_equal 'nobody knows',  @cards[2].answer
    assert_equal 'justin bieber', @cards[3].answer
  end
end
