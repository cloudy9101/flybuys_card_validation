# frozen_string_literal: true

class Card
  attr_reader :card_number

  def initialize(card_number, card_parser, validator)
    @card_number = card_number
    @card_parser = card_parser
    @validator = validator
  end

  def card_type_name
    card_type.name
  end

  def valid?
    card_type.valid && validator.validate(card_number)
  end

  private

  attr_reader :card_parser, :validator

  def card_type
    @card_type ||= card_parser.parse(card_number)
  end
end
