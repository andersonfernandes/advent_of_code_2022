# frozen_string_literal: true

module Solutions
  class Day8
    include Runner

    def run
      grid = raw_input.map { |line| line.chars.map(&:to_i) }
      grid_t = grid.transpose
      highest_score = 0

      grid.each_with_index do |line, line_index|
        line.each_with_index do |item, item_index|
          left_part = [-1, *line[0...item_index].reverse]
          left = left_part.index { |e| e >= item } || left_part.size - 1

          top_part = [-1, *grid_t[item_index][0...line_index].reverse]
          top = top_part.index { |e| e >= item } || top_part.size - 1

          right_part = [-1, *line[item_index + 1..]]
          right = (right_part.index { |e| e >= item } || right_part.size - 1)

          down_part = [-1, *grid_t[item_index][line_index + 1..]]
          down = (down_part.index { |e| e >= item } || down_part.size - 1)

          highest_score = [(top * right * down * left), highest_score].max
        end
      end

      highest_score
    end
  end
end
