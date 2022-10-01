# frozen_string_literal: true

class InputParser
  def parse(input)
    lines = input.strip.each_line(chomp: true).map do |line|
      line.strip.gsub(/\D/, '')
    end
    lines.filter { |line| !line.empty? }
  end
end
