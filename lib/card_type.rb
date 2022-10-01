# frozen_string_literal: true

class CardType
  attr_reader :name, :valid

  def initialize(name, matcher, valid: true)
    @name = name
    @matcher = matcher
    @valid = valid
  end

  def match(card_number)
    matcher.call(card_number)
  end

  private

  attr_reader :matcher
end
