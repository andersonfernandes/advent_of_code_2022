# frozen_string_literal: true

require 'securerandom'

module Solutions
  class Day7
    include Runner

    MAX_FILESYSTEM_SIZE = 70_000_000
    MIN_SIZE_TO_UPDATE = 30_000_000

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

      root_folder[:folder_size] = folder_size(root_folder)
      space_needed = MIN_SIZE_TO_UPDATE - (MAX_FILESYSTEM_SIZE - root_folder[:folder_size])

      diffs = {}
      find_folders_diffs(root_folder, space_needed, diffs)
      diffs.max_by { |(_, value)| value }.first
    end

    private

    def folder_size(folder)
      return folder[:size] if folder.key?(:size)

      size = folder[:child].reduce(0) do |total_size, child|
        total_size + folder_size(child)
      end

      folder[:folder_size] = size

      size
    end

    def find_folders_diffs(folder, space_needed, diffs)
      return if folder.key?(:size)

      diff = (space_needed - folder[:folder_size])
      diffs[folder[:folder_size]] = diff if diff.negative?

      folder[:child].each do |child|
        find_folders_diffs(child, space_needed, diffs)
      end
    end
  end
end
