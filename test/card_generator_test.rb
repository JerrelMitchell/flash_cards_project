require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/deck'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @cards = CardGenerator.new('cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_can_recognize_an_external_file
    assert_equal 'cards.txt', @cards.filename
  end

  def test_it_creates_deck_of_cards
    deck = Deck.new(@cards)
    assert_equal deck, @cards
  end
end
