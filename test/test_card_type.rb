# frozen_string_literal: true

require 'minitest/autorun'
require './lib/card_type'

class TestCardType < MiniTest::Test
  def setup
    @matcher = MiniTest::Mock.new
    @card_type = CardType.new('card_name', @matcher)
  end

  def test_match
    card_number = 'random card number'
    @matcher.expect(:call, true, [card_number])
    assert @card_type.match(card_number)

    card_number = 'random card number'
    @matcher.expect(:call, false, [card_number])
    refute @card_type.match(card_number)
  end
end
