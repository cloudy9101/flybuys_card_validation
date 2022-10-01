# frozen_string_literal: true

CARD_TYPES = [{
  name: 'Fly Buys Black',
  matcher: ->(card_number) { card_number.start_with?('60141') && [16, 17].include?(card_number.length) },
  valid: true
}, {
  name: 'Fly Buys Red',
  matcher: ->(card_number) { card_number.start_with?('6014352') && card_number.length == 16 },
  valid: true
}, {
  name: 'Fly Buys Green',
  matcher: lambda do |card_number|
    (6_014_355_526..6_014_355_529).include?(card_number[0, 10].to_i) && card_number.length == 16
  end,
  valid: true
}, {
  name: 'Fly Buys Blue',
  matcher: ->(card_number) { card_number.start_with?('6014') && card_number.length == 16 },
  valid: true
}, {
  name: 'Unknown',
  matcher: ->(_) { true },
  valid: false
}].freeze
