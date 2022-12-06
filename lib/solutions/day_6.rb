# frozen_string_literal: true

module Solutions
  class Day6
    include Runner

    def run
      input = raw_input.first.chars
      marker_index = -1
      input.each_with_index do |_, index|
        if input[index..index+3].uniq.size == 4
          marker_index = index + 4
          break
        end
      end

      marker_index
    end
  end
end
