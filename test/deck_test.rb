require 'minitest/autorun'
require 'minitest/pride'
require './lib/flash_cards'
require './lib/deck'
require 'simplecov'
SimpleCov.start

class DeckTest < Minitest::Test
  def setup
    @card1 = FlashCard.new('What is the capital of Alaska?', 'Juneau')
    @card2 = FlashCard.new('The Viking spacecraft sent back to Earth photographs and
                      reports about the surface of which planet?', 'Mars')
    @card3 = FlashCard.new('Describe in words the exact direction that is 697.5°
                      clockwise from due north?', 'North north west')
    @deck = Deck.new([@card1, @card2, @card3])
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_can_create_a_deck_of_cards
    assert_equal @deck.cards, [@card1, @card2, @card3]
  end

  def test_can_count_a_deck_of_cards
    assert_equal @deck.cards, [@card1, @card2, @card3]
    assert_equal 3, @deck.count
  end
end
