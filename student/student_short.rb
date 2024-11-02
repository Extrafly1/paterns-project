require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\base_student.rb'

class Student_short < BaseStudent
  attr_reader :surname_initials, :contact

  def self.initialize_from_student(student)
    new(
      id: student.id, 
      git: student.git, 
      surname_initials: "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}", 
      contact: student.get_contact
    )
  end

  def self.initialize_from_string(string)
    attributes = {}

    string.split(', ').each do |pair|
      key, value = pair.split(': ')
      attributes[key] = value
    end

    new(
      id: attributes['ID'],
      git: attributes['Git'],
      surname_initials: attributes['ФИО'],
      contact: attributes['Тел']||attributes['Телеграм']||attributes['Почта']||nil
    )
  end

  def to_s
    "ID: #{@id}, ФИО: #{@surname_initials} Git: #{@git ? @git : 'нет'} Контакт: #{@contact ? @contact : 'нет'} "
  end

  def has_contact?()
    if self.contact == nil
      false
    else
      true  
    end
  end

  def surname_initials=(value)
    if value.match?(/\A[А-ЯЁ][а-яё]+\s[А-ЯЁ]\.\s[А-ЯЁ]\.\z/)
      @surname_initials = value
    elsif value.match?(/\A[А-ЯЁ][а-яё]+\s[А-ЯЁ]\.\z/)
      @surname_initials = value
    else
      raise ArgumentError, "Неправильно введено ФИО"
    end
  end

  private
  
  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    self.surname_initials = surname_initials
    @contact = contact
  end
end
