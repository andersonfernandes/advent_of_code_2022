# frozen_string_literal: true

module Solutions
  class Day4
    include Runner

    def run
      raw_input.reduce(0) do |total, pairs|
        range_a, range_b = pairs.split(',').map do |range|
          a, b = range.split('-').map(&:to_i)
          (a..b).to_a
        end

        total += 1 if range_a.intersection(range_b).any?

        total
      end
    end
  end
end
