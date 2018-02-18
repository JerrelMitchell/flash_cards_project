require 'pry'
# will funnel information from .txt file to cards class.
class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    File.readlines(@filename).map do |line|
      line_array = line.rpartition(',')
      @generated_card = Card.new(line_array.first, line_array.last.strip)
    end
    @generated_card
  end
end
