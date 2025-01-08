require 'json'
require 'yaml'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\StudentListStrategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_json.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_yaml.rb'

class StudentsListBase
  attr_reader :file_path, :strategy

  def initialize(file_path, strategy)
    @file_path = file_path
    @strategy = strategy
    @students = []
  end

  def read_all
    @students = @strategy.parse_file(file_path) || []
  end

  def write_all
    @strategy.save_to_file(file_path, @students)
  end

  def get_student_by_id(id)
    @students.find { |student| student[:id] == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start_index = (k - 1) * n
    selected_students = @students[start_index, n]&.map do |student|
      Student_short.new(
        id: student[:id],
        git: student[:git],
        surname_initials: student[:surname_initials],
        contact: student[:contact]
      )
    end
    data_list ||= DataListStudentShort.new([])
    data_list.instance_variable_set(:@objects, selected_students || [])
    data_list
  end

  def sort_by_name
    @students.sort_by! { |student| student[:surname_initials] }
  end

  def add_student(student)
    new_id = (@students.map { |s| s[:id] }.max || 0) + 1
    student[:id] = new_id
    @students << student
    new_id
  end

  def update_student(id, updated_student)
    student = get_student_by_id(id)
    return false unless student

    student.merge!(updated_student)
    true
  end

  def delete_student(id)
    @students.reject! { |student| student[:id] == id }
  end

  def get_student_count
    @students.size
  end
end