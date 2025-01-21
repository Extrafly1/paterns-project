require 'oci8'

class DatabaseConnection
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  def initialize
    @connection = OCI8.new('SYS', '123', '//localhost:1521/XE', :SYSDBA)
  end

  def query(sql)
    cursor = @connection.exec(sql)
    result = []
    while row = cursor.fetch_hash
      result << row
    end
    cursor.close
    result
  end

  def execute(sql)
    @connection.exec(sql)
    @connection.commit
  end
end
