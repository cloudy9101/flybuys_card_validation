# frozen_string_literal: true

require 'minitest/autorun'
require './lib/validator'

class TestValidator < MiniTest::Test
  def setup
    @validator = Validator.new
  end

  def test_validate
    # valid card number
    assert @validator.validate('60141016700078611')
    assert @validator.validate('6014111100033006')
    assert @validator.validate('6014709045001234')
    assert @validator.validate('6014352700000140')
    assert @validator.validate('6014355526000020')

    # invalid card number
    refute @validator.validate('6014152705006141')
    refute @validator.validate('6014355529000028')
    refute @validator.validate('6013111111111111')
  end
end
