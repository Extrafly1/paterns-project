class ConcreteObserverB < Observer
  def update(data)
    puts "ConcreteObserverB received update with data: #{data}"
  end
end