# frozen_string_literal: true

module Solutions
  class Day1
    include Runner

    def run
      calories_by_elf = raw_input.reduce([]) do |elfs, calories|
        next elfs.push(calories.to_i || 0) if elfs.empty? || calories.empty?

        elfs[elfs.size-1] += calories.to_i

        elfs
      end

      calories_by_elf.sort.last(3).sum
    end
  end
end
