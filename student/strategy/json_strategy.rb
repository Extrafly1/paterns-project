require 'json'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\file_strategy.rb'

class JSONStrategy < FileStrategy
  def read(file_path)
    return [] unless File.exist?(file_path) && !File.read(file_path).strip.empty?

    JSON.parse(File.read(file_path), symbolize_names: true)
  end

  def write(file_path, data)
    File.write(file_path, JSON.pretty_generate(data))
  end
end
