# frozen_string_literal: true

class CardParser
  def initialize(card_types)
    @card_types = card_types
  end

  def parse(card_number)
    card_types.find { |card_type| card_type.match(card_number) }
  end

  private

  attr_reader :card_types
end
