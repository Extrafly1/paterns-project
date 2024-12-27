require 'json'
require 'yaml'

# Базовый класс
class StudentsListBase
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @students = []
  end

  def read_all
    @students = parse_file || []
  end

  def write_all
    save_to_file(@students)
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

  # Абстрактные методы, которые нужно переопределить в подклассах
  def parse_file
    raise NotImplementedError, 'Метод parse_file должен быть реализован в подклассе'
  end

  def save_to_file(_data)
    raise NotImplementedError, 'Метод save_to_file должен быть реализован в подклассе'
  end
end