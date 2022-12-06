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

        overlapping_ranges = (range_a - range_b).empty? || (range_b - range_a).empty?
        total += 1 if overlapping_ranges

        total
      end
    end
  end
end
