class BaseStudent
  attr_reader :id, :git

  def initialize(id:, git: nil)
    self.id = id
    self.git = git if !git.nil?
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end

  protected # кастуем щиты от чужих

  # validators for setters
  def self.validate_git(git)
    git.match?(/\A(https?:\/\/|git@)[-a-zA-Z0-9@:%_\+.~#=]+(\.[a-zA-Z]{2,6}|:[0-9]{1,5})?\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
    true
  end

  def self.valid_id(id)
    id.match?(/^\d+$/)
  end

  def self.validate_fio(name)
    name.match?(/^[a-zA-Zа-яА-Я\s]+$/)
  end

  def self.validate_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

  def self.validate_email(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def self.validate_telegram(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
  end

  # setters
  def id=(id)
    if BaseStudent.valid_id(id)
      @id = id
    else
      raise ArgumentError, "Неправильно введен id"
    end
  end

  def git=(git)
    if BaseStudent.validate_git(git)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
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

  def telegram=(telegram)
    if self.class.validate_telegram(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Неправильно введен телеграм"
    end
  end

  def name=(name)
    if self.class.validate_fio(name)
      @name = name
    else
      raise ArgumentError, "Неправильно введено имя"
    end
  end

  def surname=(surname) 
    if self.class.validate_fio(surname)
      @surname = surname
    else
      raise ArgumentError, "Неправильно введена фамилия"
    end
  end

  def patronymic=(patronymic)
    if self.class.validate_fio(patronymic)
      @patronymic = patronymic
    else
      raise ArgumentError, "Неправильно введено отчество"
    end
  end
end
  