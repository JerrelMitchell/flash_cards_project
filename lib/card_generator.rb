# will funnel information from .txt file to cards class.
class CardGenerator
  attr_accessor :cards

  def initialize(filename)
    @cards = []
    File.open(filename, 'r').each_line do |line|
      card_array = line.split(/\n/)
      question, answer = card_array.map do |card|
        card.split(',')
      end.flatten
      card = Card.new(question, answer)
      @cards.push(card)
    end
  end
end
