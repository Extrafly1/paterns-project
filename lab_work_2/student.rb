class Student < BaseStudent
  attr_accessor :contact

  def initialize(args = {})
    super(args)
    @contact = contact_info if contact_info_present?
  end

  def getInfo
    initials = "#{@surname} #{initials}"
    contact = @contact
    "#{initials}; Гит: #{@git}; Связь: #{contact}"
  end

  def get_surname_and_initials
    "#{@surname} #{initials}"
  end

  def get_git
    @git
  end

  def get_contact
    @contact
  end
end