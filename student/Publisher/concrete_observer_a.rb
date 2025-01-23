class ConcreteObserverA < Observer
  def update(data)
    puts "ConcreteObserverA received update with data: #{data}"
  end
end
