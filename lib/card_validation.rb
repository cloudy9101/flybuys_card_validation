# frozen_string_literal: true

require_relative 'card'
require_relative 'card_parser'
require_relative 'validator'
require_relative 'card_type'
require_relative 'card_types'
require_relative 'input_parser'
require_relative 'output_formatter'

class CardValidation
  def initialize
    card_types = CARD_TYPES.map do |card_type|
      CardType.new(card_type[:name], card_type[:matcher], valid: card_type[:valid])
    end
    @card_parser = CardParser.new(card_types)
    @validator = Validator.new
  end

  def run(input)
    InputParser.new.parse(input).each do |card_number|
      card = Card.new(card_number, @card_parser, @validator)
      puts OutputFormatter.new.format(card)
    end
  end

  private

  attr_reader :card_parser, :validator
end
