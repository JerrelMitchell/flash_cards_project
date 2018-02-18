require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/deck'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @filename = 'cards.txt'
    @cards = CardGenerator.new(@filename).cards
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_reads_files_and_puts_them_into_array
    assert_instance_of Card, @cards.cards_array
  end
end
