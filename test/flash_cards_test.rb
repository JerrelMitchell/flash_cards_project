require 'minitest/autorun'
require 'minitest/pride'
require './lib/flash_cards'
require 'simplecov'
SimpleCov.start

class FlashCardsTest < Minitest::Test
  def setup
    @card = FlashCard.new('What is the capital of Alaska?', 'Juneau')
  end

  def test_card_exists
    assert_instance_of FlashCard, @card
  end

  def test_can_ask_a_question
    assert_equal 'What is the capital of Alaska?', @card.question
  end

  def test_can_give_answer_to_a_question
    assert_equal 'Juneau', @card.answer
  end
end
