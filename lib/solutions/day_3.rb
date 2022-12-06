# frozen_string_literal: true

module Solutions
  class Day3
    include Runner

    ALPHABET = ['', *('a'..'z').to_a, *('A'..'Z').to_a].freeze

    def run
      raw_input.map(&:chars).each_slice(3).reduce(0) do |total, items|
        a, b, c = items
        badge = a.intersection(b).intersection(c).first

        total += ALPHABET.find_index(badge)
      end
    end
  end
end
