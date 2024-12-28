require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\base_student.rb'
require 'date'

class Student < BaseStudent
  include Comparable
  attr_reader :surname, :name, :patronymic, :birth_date, :phone, :email, :telegram, :git

  def initialize(surname:, name:, patronymic:, birth_date:, id: nil, phone: nil, email: nil, git: nil, telegram: nil)
    super(id: id, git: git)

    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.birth_date = birth_date

    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def birth_date=(birth_date)
    @birth_date = Date.parse(birth_date) rescue raise(ArgumentError, "Неправильный формат даты рождения")
  end
  
  def <=>(other)
    birth_date <=> other.birth_date
  end
  
  def self.create_from_string(string)
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
      birth_date: attributes['Дата рождения'],
      phone: attributes['Телефон'],
      telegram: attributes['Телеграм'],
      email: attributes['Почта'],
      git: attributes['Гит']
    )
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Дата рождения: #{@birth_date}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
  

  def get_contact()
    contact_info = ''
  
    if !@phone.nil?
      contact_info = "Телефон: #{@phone} "
    elsif !@telegram.nil?
      contact_info = "Телеграм: #{@telegram} "
    elsif !@email.nil?
      contact_info = "Почта: #{@email} "
    end
  
    contact_info
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

  def get_info()
    "ID: #{@id}, ФИО: #{@surname} #{@name[0]}.#{@patronymic ? " #{@patronymic[0]}." : ''}, Git: #{@git ? @git : ''}, Тел: #{@phone ? @phone : ''}, Телеграм: #{@telegram ? @telegram : ''}, Почта: #{@email ? @email : ''} " \
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

  protected # кастуем щиты от чужих
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
end
