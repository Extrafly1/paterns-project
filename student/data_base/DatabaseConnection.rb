require 'tiny_tds'

class DatabaseConnection
  @instance = nil

  def self.instance
    @instance ||= new
  end

  private_class_method :new

  def initialize
    @client = TinyTds::Client.new(
      username: '',
      password: '',
      host: 'DESKTOP-F9CE6LM',
      database: 'STUDENT_SHORT',
      azure: false,
      timeout: 5
    )
  end

  def execute(sql)
    result = @client.execute(sql)
    #result.each do |row|
    #  puts row
    #end
  end

  def query(sql)
    result = []
    cursor = @client.execute(sql)
    cursor.each do |row|
      result << row
    end
    result
  end
end
