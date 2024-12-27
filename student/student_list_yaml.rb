require 'yaml'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list_student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_base.rb'

class StudentsListYAML < StudentsListBase
  def parse_file
    return unless File.exist?(file_path) && !File.read(file_path).strip.empty?

    YAML.load_file(file_path, symbolize_names: true)
  end

  def save_to_file(data)
    File.write(file_path, data.to_yaml)
  end
end