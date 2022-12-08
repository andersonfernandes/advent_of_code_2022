# frozen_string_literal: true

module Solutions
  class Day8
    include Runner

    def run
      grid = raw_input.map { |line| line.chars.map(&:to_i) }
      grid_t = grid.transpose
      n_visible = 0

      grid.each_with_index do |line, line_index|
        line.each_with_index do |item, item_index|
          left = line[0...item_index].max || -1
          right = line[item_index + 1..].max || -1
          top = grid_t[item_index][0...line_index].max || -1
          down = grid_t[item_index][line_index + 1..].max || -1

          n_visible += 1 if left < item || right < item || down < item || top < item
        end
      end

      n_visible
    end
  end
end
