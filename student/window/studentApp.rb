require 'fox16'
include Fox
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\DatabaseConnection.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\controller\student_list_controller.rb'

require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\base_student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\StudentTree.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list_student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_json.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_yaml.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_base.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\file_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\json_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\yaml_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\students_file_handler.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\StudentListStrategy.rb'

class StudentApp < FXMainWindow
  attr_accessor :controller, :current_page, :rows_per_page, :data_list_student_short

  def initialize(app)
    super(app, "Student Application", width: 800, height: 600)
    database_connection = DatabaseConnection.instance
    @controller = StudentListController.new(self, database_connection)

    # Инициализация переменных для пагинации
    @current_page = 0
    @rows_per_page = 20

    # Инициализация data_list_student_short
    @data_list_student_short = DataListStudentShort.new

    # Создание интерфейса
    create_interface
  end

  def create_interface
    # Создание вкладок
    tabBook = FXTabBook.new(self, opts: LAYOUT_FILL_X|LAYOUT_FILL_Y)

    # Вкладка 1: Список студентов
    studentTab = FXTabItem.new(tabBook, "Студенты")
    studentFrame = FXVerticalFrame.new(tabBook, opts: LAYOUT_FILL_X|LAYOUT_FILL_Y)

    # Область фильтрации
    filterFrame = FXVerticalFrame.new(studentFrame, opts: LAYOUT_FILL_X)

    # 1 часть: Поле для ввода фамилии и инициалов
    nameFrame = FXHorizontalFrame.new(filterFrame, opts: LAYOUT_FILL_X)
    FXLabel.new(nameFrame, "Фамилия и инициалы:")
    nameField = FXTextField.new(nameFrame, 20)

    # 2 часть: Гит
    gitFrame = FXHorizontalFrame.new(filterFrame, opts: LAYOUT_FILL_X)
    gitLabel = FXLabel.new(gitFrame, "Гит:")
    gitCombo = FXComboBox.new(gitFrame, 3, opts: COMBOBOX_STATIC|LAYOUT_FILL_X)
    gitCombo.numVisible = 3
    gitCombo.appendItem("Да")
    gitCombo.appendItem("Нет")
    gitCombo.appendItem("Не важно")
    gitText = FXTextField.new(gitFrame, 20)
    gitText.enabled = false

    gitCombo.connect(SEL_COMMAND) do |sender, sel, data|
      gitText.enabled = (data == 0) # Включить поле, если выбрано "Да"
    end

    # 3 часть: Почта
    emailFrame = FXHorizontalFrame.new(filterFrame, opts: LAYOUT_FILL_X)
    emailLabel = FXLabel.new(emailFrame, "Почта:")
    emailCombo = FXComboBox.new(emailFrame, 3, opts: COMBOBOX_STATIC|LAYOUT_FILL_X)
    emailCombo.numVisible = 3
    emailCombo.appendItem("Да")
    emailCombo.appendItem("Нет")
    emailCombo.appendItem("Не важно")
    emailText = FXTextField.new(emailFrame, 20)
    emailText.enabled = false

    emailCombo.connect(SEL_COMMAND) do |sender, sel, data|
      emailText.enabled = (data == 0) # Включить поле, если выбрано "Да"
    end

    # 4 часть: Телефон
    phoneFrame = FXHorizontalFrame.new(filterFrame, opts: LAYOUT_FILL_X)
    phoneLabel = FXLabel.new(phoneFrame, "Телефон:")
    phoneCombo = FXComboBox.new(phoneFrame, 3, opts: COMBOBOX_STATIC|LAYOUT_FILL_X)
    phoneCombo.numVisible = 3
    phoneCombo.appendItem("Да")
    phoneCombo.appendItem("Нет")
    phoneCombo.appendItem("Не важно")
    phoneText = FXTextField.new(phoneFrame, 20)
    phoneText.enabled = false

    phoneCombo.connect(SEL_COMMAND) do |sender, sel, data|
      phoneText.enabled = (data == 0) # Включить поле, если выбрано "Да"
    end

    # 5 часть: Телеграм
    telegramFrame = FXHorizontalFrame.new(filterFrame, opts: LAYOUT_FILL_X)
    telegramLabel = FXLabel.new(telegramFrame, "Телеграм:")
    telegramCombo = FXComboBox.new(telegramFrame, 3, opts: COMBOBOX_STATIC|LAYOUT_FILL_X)
    telegramCombo.numVisible = 3
    telegramCombo.appendItem("Да")
    telegramCombo.appendItem("Нет")
    telegramCombo.appendItem("Не важно")
    telegramText = FXTextField.new(telegramFrame, 20)
    telegramText.enabled = false

    telegramCombo.connect(SEL_COMMAND) do |sender, sel, data|
      telegramText.enabled = (data == 0) # Включить поле, если выбрано "Да"
    end

    # Таблица студентов
    @studentTable = FXTable.new(studentFrame, opts: LAYOUT_FILL_X|LAYOUT_FILL_Y|TABLE_READONLY)
    @studentTable.setTableSize(20, 4)
    @studentTable.setColumnText(0, "ID")
    @studentTable.setColumnText(1, "ФИО")
    @studentTable.setColumnText(2, "GIT")
    @studentTable.setColumnText(3, "Контакты")

    # Обновление данных из базы данных
    @controller.refresh_data

    # Область управления
    controlFrame = FXHorizontalFrame.new(studentFrame, opts: LAYOUT_FILL_X)
    prevButton = FXButton.new(controlFrame, "Предыдущая")
    nextButton = FXButton.new(controlFrame, "Следующая")
    @pageLabel = FXLabel.new(controlFrame, "Страница 1 из #{total_pages}")

    prevButton.connect(SEL_COMMAND) { @controller.change_page(-1) }
    nextButton.connect(SEL_COMMAND) { @controller.change_page(1) }

    # Третья область с кнопками
    buttonFrame = FXHorizontalFrame.new(studentFrame, opts: LAYOUT_FILL_X)
    addButton = FXButton.new(buttonFrame, "Добавить")
    editButton = FXButton.new(buttonFrame, "Изменить")
    deleteButton = FXButton.new(buttonFrame, "Удалить")
    refreshButton = FXButton.new(buttonFrame, "Обновить")

    # Обновление доступности кнопок
    @studentTable.connect(SEL_CHANGED) do
      update_button_states(editButton, deleteButton)
    end

    # Обработчики кнопок
    addButton.connect(SEL_COMMAND) { add_student }
    editButton.connect(SEL_COMMAND) { edit_student }
    deleteButton.connect(SEL_COMMAND) { delete_student }
    refreshButton.connect(SEL_COMMAND) { @controller.refresh_data }

    # Закрытие окна
    self.connect(SEL_CLOSE) do
      handleClose
    end
  end

  def change_page(direction)
    new_page = @current_page + direction
    if new_page >= 0 && new_page < total_pages
      @current_page = new_page
      update_table
      update_page_label
    end
  end

  def total_pages
    student_count = @data_list_student_short.data ? @data_list_student_short.data.size : 0
    [1, (student_count / @rows_per_page.to_f).ceil].max
  end

  def update_button_states(editButton, deleteButton)
    selected_rows = @studentTable.selStartRow...@studentTable.selEndRow
    selected_count = selected_rows.count { |row| @studentTable.rowSelected?(row) }
  
    editButton.enabled = (selected_count == 1)
    deleteButton.enabled = (selected_count > 0)
  end
  

  def add_student
    # Логика добавления студента
  end

  def edit_student
    # Логика изменения студента
  end

  def delete_student
    # Логика удаления студента
  end

  def handleClose
    exit
  end

  def set_table_params(column_names, row_count)
    @studentTable.setTableSize(row_count, column_names.size)
    column_names.each_with_index do |name, index|
      @studentTable.setColumnText(index, name)
    end
  end

  def set_table_data(data)
    data.each_with_index do |student_short, row|
      student_short.to_h.each_with_index do |(key, value), col|
        @studentTable.setItemText(row, col, value.to_s)
      end
    end
  end
end

# Запуск приложения
if __FILE__ == $0
  application = FXApp.new
  application.init(ARGV)
  main_window = StudentApp.new(application)
  application.create
  main_window.show(PLACEMENT_SCREEN) # Показать окно
  application.run
end