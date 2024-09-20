class Student
  attr_accessor :id, :surname, :name, :patronymic

  def initialize(args = {})
    @id = generate_id
    @surname = args[:surname] || "Не указано"
    @name = args[:name] || "Не указано"
    @patronymic = args[:patronymic]
    
    set_contacts(args) if args.key?(:phone) || args.key?(:telegram) || args.key?(:email) || args.key?(:git) # Проверка на наличие контактных данных
  end

  def self.from_string(input)
    begin
      data = input.split(",").map(&:strip)
      raise ArgumentError, "Неверный формат строки" if data.size < 4

      args = {
        surname: data[0],
        name: data[1],
        patronymic: data[2],
        phone: data[3],
        telegram: data[4],
        email: data[5],
        git: data[6]
      }.compact

      new(args)  # Вызов стандартного конструктора
    rescue ArgumentError => e
      raise ArgumentError, "Ошибка при парсинге: #{e.message}"
    end
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

  def self.validate_email(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def self.validate_telegram(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
  end

  def self.validate_git(git)
    git.match?(/\A(https?:\/\/|git@)[-a-zA-Z0-9@:%_\+.~#=]+(\.[a-zA-Z]{2,6}|:[0-9]{1,5})?\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/) # Проверка на наличие Git URL
  end
  
  def set_contacts(args = {})
    @phone = args[:phone] if args.key?(:phone) && self.class.validate_phone(args[:phone]) #
    @telegram = args[:telegram] if args.key?(:telegram) && self.class.validate_telegram(args[:telegram]) # 
    @email = args[:email] if args.key?(:email) && self.class.validate_email(args[:email]) #
    @git = args[:git] if args.key?(:git) && self.class.validate_git(args[:git]) # 
  end

  def phone=(phone)
    if self.class.validate_phone(phone)
      @phone = phone
    else
      raise ArgumentError, "Неправильно введен телефон"
    end
  end

  def email=(email)
    if self.class.validate_email(email)
      @email = email
    else
      raise ArgumentError, "Неправильно введен email"
    end
  end

  def git=(git)
    if self.class.validate_git(git)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end

  def telegram=(telegram)
    if self.class.validate_telegram(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Неправильно введен телеграм"
    end
  end

  def contact_info_present?
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end

  def validate
    raise ArgumentError, "Отсутствует Git URL" unless @git
    raise ArgumentError, "Отсутствует контактная информация" unless contact_info_present?
  end
end
