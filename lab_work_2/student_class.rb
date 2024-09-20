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

  def self.validate_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
    #     - \A: Указывает на начало строки.
    #     - (\+\d{1,3}\s?)?: 
    #     - \+ — символ +, который указывает на начало международного кода.
    #     - \d{1,3} — одна, две или три цифры, представляющие код страны.
    #     - \s? — необязательный пробел после кода страны.
    #     - \(?\d{3}\)?: 
    #     - \(? — необязательные скобки перед тремя цифрами (код города).
    #     - \d{3} — три цифры.
    #     - \)? — необязательные скобки после кода города.
    #     - [-.\s]?: Необязательный разделитель, который может быть дефисом, точкой или пробелом.
    #     - \d{3}: Три цифры.
    #     - [-.\s]?: Необязательный разделитель.
    #     - \d{4}: Четыре цифры.
    #     - \z: Указывает на конец строки.
  end

  def phone=(phone)
    if Student.validate_phone(phone)
      @phone = phone
    else
      raise ArgumentError, "Неправильно введен телефон"
    end
  end

end