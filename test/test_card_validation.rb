# frozen_string_literal: true

require 'minitest/autorun'
require './lib/card_validation'

class TestCardValidation < MiniTest::Test
  def setup
    @validation = CardValidation.new
  end

  def test_run
    input = <<~INPUT
      60141016700078611
      6014152705006141
      6014111100033006
      6014709045001234
      6014352700000140
      6014355526000020
      6014 3555 2600 0028
      6013111111111111
    INPUT
    output = <<~OUTPUT
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Black: 6014111100033006 (valid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Red: 6014352700000140 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Fly Buys Green: 6014355526000028 (invalid)
      Unknown: 6013111111111111 (invalid)
    OUTPUT
    assert_output(output) { @validation.run(input) }
  end

  def test_run_with_messy_input
    input = <<~INPUT
      
      60141016700078611

      601415 2705006141a
      60141 1110 0033006b

      c601470904f5001234
      6014352700 000140
      d601435 5526000020
      6014 3555 2600 0028
      6013e111111111111

    INPUT
    output = <<~OUTPUT
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Black: 6014111100033006 (valid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Red: 6014352700000140 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Fly Buys Green: 6014355526000028 (invalid)
      Unknown: 6013111111111111 (invalid)
    OUTPUT
    assert_output(output) { @validation.run(input) }
  end
end
