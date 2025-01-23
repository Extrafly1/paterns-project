class Publisher
  def initialize
    @observers = []
  end

  def subscribe(observer)
    @observers << observer
  end

  def unsubscribe(observer)
    @observers.delete(observer)
  end

  def notify(data)
    @observers.each { |observer| observer.update(data) }
  end

  def change_state(data)
    puts "Publisher state changed to: #{data}"
    notify(data)
  end
end