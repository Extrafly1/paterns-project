class Student_short < BaseStudent
  attr_reader :id, :surname_initials, :git, :contact

  def initialize(student)
    super
    @id = student.id
    @surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}"
    @git = student.get_git
    @contact = student.contact_info_present? ? student.contact_info : "Нет контактной информации"
  end

  def self.from_string(id, info_string)
    data = info_string.split(",").map(&:strip)
    raise ArgumentError, "Неверный формат строки" if data.size < 4

    surname = data[0]
    name = data[1]
    patronymic = data[2]
    git = data[3]
    contact = data[4] if data.size > 4

    student = BaseStudent.new(surname: surname, name: name, patronymic: patronymic, git: git)
    student.set_contacts(phone: contact) if contact
    new(student)
  end
end