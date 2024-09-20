class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(args = {})
    @id = generate_id
    @surname = args[:surname] || "Не указано"
    @name = args[:name] || "Не указано"
    @patronymic = args[:patronymic]
    self.phone = args[:phone] if args.key?(:phone)
    self.telegram = args[:telegram] if args.key?(:telegram)
    self.email = args[:email] if args.key?(:email)
    self.git = args[:git] if args.key?(:git)
    
    validate
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
    git.match?(/\A(https?:\/\/|git@)[-a-zA-Z0-9@:%_\+.~#=]+(\.[a-zA-Z]{2,6}|:[0-9]{1,5})?\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
  end
  
  def phone=(phone)
    if phone.nil? || Student.validate_phone(phone)
      @phone = phone
    else
      raise ArgumentError, "Неправильно введен телефон"
    end
  end

  def email=(email)
    if email.nil? || Student.validate_email(email)
      @email = email
    else
      raise ArgumentError, "Неправильно введен email"
    end
  end

  def git=(git)
    if git.nil? || Student.validate_git(git)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end

  def telegram=(telegram)
    if telegram.nil? || Student.validate_telegram(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Неправильно введен телеграм"
    end
  end

  def contact_info_present?
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  def validate
    raise ArgumentError, "Отсутствует Git URL" unless git
    raise ArgumentError, "Отсутствует контактная информация" unless contact_info_present?
  end
end
