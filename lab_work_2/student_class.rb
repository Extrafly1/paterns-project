class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(surname, name, patronymic = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = generate_id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def generate_id
    Random.rand(1000..9999)
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end