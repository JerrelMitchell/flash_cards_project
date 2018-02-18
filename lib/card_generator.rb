require 'pry'
# will funnel information from .txt file to cards class.
class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards_array
    File.readlines(@filename).each { |line| line.rpartition(',').compact }
  end

  def from_file_to_cards
    Card.new(cards_array.first, cards_array.last)
  end
end
