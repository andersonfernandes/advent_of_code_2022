# frozen_string_literal: true

module Solutions
  class Day2
    include Runner

    # A for Rock, B for Paper, and C for Scissors

    WIN_MAP = {
      'A' => 'B',
      'B' => 'C',
      'C' => 'A'
    }.freeze
    LOSE_MAP = {
      'B' => 'A',
      'C' => 'B',
      'A' => 'C'
    }.freeze
    SHAPE_POINTS = {
      'A' => 1,
      'B' => 2,
      'C' => 3
    }.freeze
    DRAW = 3
    WIN = 6

    def run
      raw_input.reduce(0) do |total, round|
        oponent, expected_result = round.split

        case expected_result
        when 'X'
          total += SHAPE_POINTS[LOSE_MAP[oponent]]
        when 'Y'
          total += DRAW + SHAPE_POINTS[oponent]
        when 'Z'
          total += WIN + SHAPE_POINTS[WIN_MAP[oponent]]
        end

        total
      end
    end
  end
end
