# frozen_string_literal: true

module Solutions
  class Day6
    include Runner

    MARKER_SIZE = 14

    def run
      input = raw_input.first.chars
      marker_index = -1

      input.index.with_index do |_, index|
        if input[index..index + MARKER_SIZE - 1].uniq.size == MARKER_SIZE
          marker_index = index + MARKER_SIZE
          break
        end
      end

      marker_index
    end
  end
end
