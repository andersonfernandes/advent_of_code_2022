# frozen_string_literal: true

module Solutions
  class Day3
    include Runner

    ALPHABET = ['', *('a'..'z').to_a, *('A'..'Z').to_a].freeze

    def run
      raw_input.reduce(0) do |total, items|
        compartment_a, compartment_b = items.chars.each_slice(items.size / 2).to_a
        shared_item = compartment_a.intersection(compartment_b).first

        total += ALPHABET.find_index(shared_item)
      end
    end
  end
end
