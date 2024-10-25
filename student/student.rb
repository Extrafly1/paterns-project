require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\kernel_and_module_classes\base_student.rb'

class Student < BaseStudent
  attr_reader :surname, :name, :patronymic

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, email: nil, git: nil, telegram: nil)
    super(id: id, git: git)

    self.surname = surname
    self.name = name
    self.patronymic = patronymic

    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
  

  def get_contacts()
    contact_info = ''
  
    if !@phone.nil?
      contact_info += "Телефон: #{@phone} "
    end
    
    if !@telegram.nil?
      contact_info += "Телеграм: #{@telegram} "
    end
    
    if !@email.nil?
      contact_info += "Почта: #{@email} "
    end
  
    contact_info
  end
  

  def self.parse(string)
    attributes = {}

    string.split(', ').each do |pair|
      key, value = pair.split(': ')
      attributes[key] = value
    end

    new(
      id: attributes['ID'],
      surname: attributes['Фамилия'],
      name: attributes['Имя'],
      patronymic: attributes['Отчество'],
      phone: attributes['Телефон'],
      telegram: attributes['Телеграм'],
      email: attributes['Почта'],
      git: attributes['Гит']
    )
  end
  
  def has_git?()
    if self.git == nil
      false
    else
      true
    end
  end

  def has_contact?()
    if @phone == nil && @telegram == nil && @email == nil
      false
    else
      true
    end
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    if !phone.nil?
      self.phone = phone
    end
    
    if !telegram.nil?
      self.telegram = telegram
    end
    
    if !email.nil?
      self.email = email
    end
  end

  def validate?()
    has_contact?() && has_git?()
  end

  def get_info()
    "ID: #{@id}, ФИО: #{@surname} #{@name[0]}.#{@patronymic ? " #{@patronymic[0]}." : ''} Git: #{@git ? @git : 'нет'} Тел: #{@phone ? @phone : 'нет'} Телеграм: #{@telegram ? @telegram : 'нет'} Почта: #{@email ? @email : 'нет'} " \
  end

  protected # кастуем щиты от чужих
  
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
