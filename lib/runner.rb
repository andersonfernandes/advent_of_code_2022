# frozen_string_literal: true

module Runner
  INPUT_FILES_FOLDER = File.join(File.dirname(__FILE__), '../inputs').freeze

  module ClassMethods
    def run(*args, **kwargs, &block)
      new(*args, **kwargs).run(&block)
    end
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def run
    raise NotImplementedError
  end

  def filename
    self.class.to_s.split('::').last.downcase
  end

  def raw_input
    File.readlines("#{INPUT_FILES_FOLDER}/#{filename}.txt").map(&:chomp)
  end
end
