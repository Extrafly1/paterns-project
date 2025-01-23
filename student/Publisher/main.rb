require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\Publisher\observer.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\Publisher\publisher.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\Publisher\concrete_observer_a.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\Publisher\concrete_observer_b.rb'

# Создаем издателя
publisher = Publisher.new

# Создаем наблюдателей
observer_a = ConcreteObserverA.new
observer_b = ConcreteObserverB.new

# Подписываем наблюдателей на издателя
publisher.subscribe(observer_a)
publisher.subscribe(observer_b)

# Изменяем состояние издателя
publisher.change_state("New State 1")
publisher.change_state("New State 2")

# Отписываем одного из наблюдателей
publisher.unsubscribe(observer_a)

# Изменяем состояние снова
publisher.change_state("New State 3")