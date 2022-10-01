# frozen_string_literal: true

class OutputFormatter
  def format(card)
    "#{card.card_type_name}: #{card.card_number} (#{card.valid? ? 'valid' : 'invalid'})"
  end
end
