require 'json'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list_student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_short.rb'

class StudentsListJSON
  def initialize(file_path)
    @file_path = file_path
    @students = []
  end

  def read_all
    if File.exist?(@file_path) && !File.read(@file_path).strip.empty?
      @students = JSON.parse(File.read(@file_path), symbolize_names: true)
    else
      @students = []
    end
  end

  def write_all
    File.write(@file_path, JSON.pretty_generate(@students))
  end

  def get_student_by_id(id)
    @students.find { |student| student[:id] == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start_index = (k - 1) * n
    selected_students = @students[start_index, n]&.map do |student|
      Student_short.new(id: student[:id], git: student[:git], surname_initials: student[:surname_initials], contact: student[:contact])
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