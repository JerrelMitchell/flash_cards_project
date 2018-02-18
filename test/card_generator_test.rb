require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/deck'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @filename = 'cards.txt'
    @cards = CardGenerator.new(@filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_reads_files_and_puts_them_into_array
    assert_equal @cards.cards_array, File.readlines(@filename)
  end

  def test_it_turns_line_from_file_into_cards
    assert_instance_of Card, @cards.from_file_to_cards
  end
end
