# frozen_string_literal: true

class Validator
  def validate(card_number)
    sum = 0
    card_number.reverse.each_char.with_index do |char, index|
      if (index % 2).zero?
        sum += char.to_i
        next
      end
      double = char.to_i * 2
      sum += double % 10 + double / 10
    end
    sum != 0 && (sum % 10).zero?
  end
end
