require 'minitest/autorun'
require 'minitest/pride'
require './lib/flash_cards'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test
  def test_it_exists
    card = Card.new('What is the capital of Alaska?', 'Juneau')

    assert_instance_of Card, card
  end

  def test_it_can_ask_a_question
    card = Card.new('What is the capital of Alaska?', 'Juneau')

    assert_equal 'What is the capital of Alaska?', card.question
  end

  def test_it_can_answer_a_question
    card = Card.new('What is the capital of Alaska?', 'Juneau')

    assert_equal 'Juneau', card.answer
  end

  def test_it_can_check_a_guess
    card  = Card.new('What is the capital of Alaska?', 'Juneau')
    guess = Guess.new('Juneau', card)

    assert_instance_of Card, guess.card
    assert_equal 'Juneau', guess.response
    assert guess.correct?
    assert_equal 'Correct!', guess.feedback
  end

  def test_it_can_check_a_wrong_guess
    card  = Card.new('Which planet is closest to the sun?', 'Mercury')
    guess = Guess.new('Saturn', card)

    assert_instance_of Card, guess.card
    refute_equal 'Saturn', guess.response
    refute guess.correct?
    assert_equal 'Incorrect.', guess.feedback
  end

  def test_it_can_store_a_deck
    card1 = Card.new('What is the capital of Alaska?', 'Juneau')
    card2 = Card.new('The Viking spacecraft sent back to Earth
                       photographs and reports about the surface
                       of which planet?', 'Mars')
    card3 = Card.new('Describe in words the exact direction that is 697.5°
                      clockwise from due north?', 'North north west')
    deck  = Deck.new([card1, card2, card3])

    assert_equal deck.cards, [card1, card2, card3]
    assert_equal 3, deck.count
  end

  def test_it_will_have_rounds
    card1 = Card.new('What is the capital of Alaska?', 'Juneau')
    card2 = Card.new('Approximately how many miles are in one
                      astronomical unit?', '93,000,000')
    deck  = Deck.new([card1, card2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
    assert_equal [], round.guesses
    assert_equal card1, round.current_card
  end
end