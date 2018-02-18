require './lib/deck'
require 'pry'
# will funnel information from .txt file to cards class.
class CardGenerator
  def initialize(filename)
    @filename = filename
    @generated_cards = []
    # binding.pry
  end

  def cards
    File.readlines(@filename).map do |line|
      line_array = line.rpartition(',')
      @generated_cards.push([Card.new(line_array.first, line_array.last.strip)])
      # binding.pry
    end
  end
end
