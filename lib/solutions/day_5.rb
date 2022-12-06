# frozen_string_literal: true

module Solutions
  class Day5
    include Runner

    def run
      divider = raw_input.find_index('')

      stacks = [nil]
      raw_input[0..divider-2].each do |line|
        line.chars.each_slice(4).with_index(1) do |slot, index|
          crane = slot.reject { |c| [' ', '[', ']'].include?(c) }.join
          stacks[index] ||= []
          stacks[index].push(crane) unless crane.empty?
        end
      end

      raw_input[divider+1..].each do |action|
        quantity, from, to = action.gsub(/'s|[?&]+|move|from|to/, '').split.map(&:to_i)

        cranes_to_move = stacks[from][0..quantity-1].reverse
        stacks[from] = stacks[from].drop(quantity)
        stacks[to] = [*cranes_to_move, *stacks[to]]
      end

      stacks.drop(1).map(&:first).join
    end
  end
end
