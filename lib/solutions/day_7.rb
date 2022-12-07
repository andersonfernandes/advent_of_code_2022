# frozen_string_literal: true

require 'securerandom'

module Solutions
  class Day7
    include Runner

    FOLDER_SIZE_THRESHOLD = 100_000

    def run
      root_folder = nil
      current_folder = nil

      raw_input.each do |line|
        if line =='$ cd ..'
          current_folder = current_folder[:parent]
        elsif line.match?('\$ cd')
          folder_name = line.split.last
          current_folder = {
            name: folder_name,
            parent: current_folder,
            child: []
          }

          current_folder[:parent][:child].push(current_folder) if current_folder[:parent]
          root_folder = current_folder if folder_name == '/' && root_folder.nil?
        elsif !line.match?('dir') && line != '$ ls'
          size, filename = line.split

          current_folder[:child].push(
            {
              name: filename,
              parent: current_folder,
              child: nil,
              size: size.to_i
            }
          )
        end
      end

      size_below_threshold = []
      root_folder[:folder_size] = folder_size(root_folder, size_below_threshold)

      size_below_threshold.sum
    end

    private

    def folder_size(folder, size_below_threshold)
      return folder[:size] if folder.key?(:size)

      size = folder[:child].reduce(0) do |total_size, child|
        total_size + folder_size(child, size_below_threshold)
      end

      size_below_threshold << size if size <= FOLDER_SIZE_THRESHOLD
      folder[:folder_size] = size

      size
    end
  end
end
