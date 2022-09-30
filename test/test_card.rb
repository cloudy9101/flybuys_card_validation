# frozen_string_literal: true

require 'minitest/autorun'
require './lib/card'

class TestCard < MiniTest::Test
  def setup
    @card_type = MiniTest::Mock.new
    @validator = MiniTest::Mock.new
    @card_parser = MiniTest::Mock.new
    card_number = 'random card number'
    @card_parser.expect(:parse, @card_type, [card_number])
    @card = Card.new(card_number, @card_parser, @validator)
  end

  def test_card_type
    card_type_name = 'card type name'
    @card_type.expect(:name, card_type_name)
    assert_equal card_type_name, @card.card_type_name
  end

  def test_valid?
    # Valid
    @card_type.expect(:valid, true)
    @validator.expect(:validate, true, [@card.card_number])
    assert @card.valid?

    # Invalid if validator failed
    @card_type.expect(:valid, true)
    @validator.expect(:validate, false, [@card.card_number])
    refute @card.valid?

    # Invalid if card type invalid
    @card_type.expect(:valid, false)
    @validator.expect(:validate, true, [@card.card_number])
    refute @card.valid?
  end
end
