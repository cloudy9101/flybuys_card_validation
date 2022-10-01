# frozen_string_literal: true

require 'minitest/autorun'
require './lib/card_parser'

class TestCardParser < MiniTest::Test
  def setup
    @card_number = 'random card number'
    @card_type1 = MiniTest::Mock.new
    @card_type2 = MiniTest::Mock.new
    @card_type3 = MiniTest::Mock.new
    @card_type1.expect(:match, false, [@card_number])
    @card_type1.expect(:name, 'card type 1')
    @card_type2.expect(:match, true, [@card_number])
    @card_type2.expect(:name, 'card type 2')
    @card_type3.expect(:match, true, [@card_number])
    @card_type3.expect(:name, 'card type 3')
    @card_parser = CardParser.new([@card_type1, @card_type2, @card_type3])
  end

  def test_parse
    card_type = @card_parser.parse(@card_number)
    assert_equal 'card type 2', card_type.name
  end
end
