# frozen_string_literal: true

module Solutions
  class Day2
    include Runner

    # A for Rock, B for Paper, and C for Scissors
    # X for Rock, Y for Paper, and Z for Scissors

    DRAW_MAP = {
      'A' => 'X',
      'B' => 'Y',
      'C' => 'Z'
    }.freeze
    WIN_MAP = {
      'A' => 'Y',
      'B' => 'Z',
      'C' => 'X'
    }.freeze
    SHAPE_POINTS = {
      'X' => 1,
      'Y' => 2,
      'Z' => 3
    }.freeze
    LOST = 0
    DRAW = 3
    WIN = 6

    def run
      raw_input.reduce(0) do |total, round|
        oponent, me = round.split

        if DRAW_MAP[oponent] == me
          total += DRAW
        elsif WIN_MAP[oponent] == me
          total += WIN
        end

        total += SHAPE_POINTS[me]
      end
    end
  end
end
