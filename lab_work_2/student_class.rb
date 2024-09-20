class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(args = {})
    @id = generate_id
    @surname = args[:surname] || "Не указано"
    @name = args[:name] || "Не указано"
    @patronymic = args[:patronymic]
    @phone = args[:phone]
    @telegram = args[:telegram]
    @email = args[:email]
    @git = args[:git]
  end

  def generate_id
    Random.rand(1000..9999)
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end