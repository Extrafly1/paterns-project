require 'yaml'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\file_strategy.rb'

class YAMLStrategy < FileStrategy
  def read(file_path)
    return [] unless File.exist?(file_path) && !File.read(file_path).strip.empty?

    YAML.load_file(file_path, symbolize_names: true)
  end

  def write(file_path, data)
    File.write(file_path, data.to_yaml)
  end
end
