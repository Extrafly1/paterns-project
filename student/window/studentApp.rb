require 'fox16'

include Fox

class StudentApp < FXMainWindow
  def initialize(app)
    super(app, "Student Management", width: 800, height: 600)

    # Создаем вкладки
    tab_book = FXTabBook.new(self, opts: LAYOUT_FILL)

    # Первая вкладка
    tab1 = FXTabItem.new(tab_book, "Список студентов")
    tab1_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое первой вкладки

    # Вторая вкладка
    tab2 = FXTabItem.new(tab_book, "Вкладка 2")
    tab2_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое второй вкладки

    # Третья вкладка
    tab3 = FXTabItem.new(tab_book, "Вкладка 3")
    tab3_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое третьей вкладки

    # Обработчик закрытия окна
    self.connect(SEL_CLOSE) do
      app.exit
    end
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    StudentApp.new(app)
    app.create
    app.run
  end
end