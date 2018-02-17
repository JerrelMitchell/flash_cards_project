
class CardGenerator < Deck
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end
end
# filename = "cards.txt"
# cards = CardGenerator.new(filename).cards

# file = File.open("sample.txt", "r")
# contents = file.read
# puts contents
