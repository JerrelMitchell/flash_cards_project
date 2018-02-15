require 'minitest/autorun'
require 'minitest/pride'
require './lib/flash_cards'

class FlashCardsTest < Minitest::Test
  def setup
    @card = Card.new('What is the capital of Alaska?', 'Juneau')
  end

  def test_flashcard_exists
    assert_instance_of Card, @card
  end

  def test_it_can_ask_a_question
    assert_equal 'What is the capital of Alaska?', @card.question
  end

  def test_it_can_give_answer_to_a_question
    assert_equal 'Juneau', @card.answer
  end
end
