class StudentsListDB
  def initialize(database_connection)
    @db = database_connection
  end

  def get_student_by_id(id)
    # Используем параметризованный запрос для получения студента по ID
    result = @db.query("SELECT * FROM student WHERE id = '#{id}'")
    student_data = result.first
    if student_data
      # Преобразуем дату в строку в формате YYYY-MM-DD
      birth_date = student_data['birth_date'].to_s

      student = Student.new(
        id: student_data['id'],
        surname: student_data['surname'],
        name: student_data['name'],
        patronymic: student_data['patronymic'],
        birth_date: birth_date,  # Используем преобразованную дату
        phone: student_data['phone'],
        email: student_data['email'],
        git: student_data['git'],
        telegram: student_data['telegram']
      )
      return student
    else
      return nil
    end
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    result = @db.query("SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM student ORDER BY id) a WHERE ROWNUM <= #{offset + n}) WHERE rnum > #{offset}")
    result.map { |row| Student_short.new(row) }
  end

  def add_student(student)
    # Формируем SQL-запрос с параметрами, не включая id
    sql = "INSERT INTO student (surname, name, patronymic, birth_date, phone, email, git, telegram) 
           VALUES ('#{student.surname}', '#{student.name}', '#{student.patronymic}', '#{student.birth_date}', 
           '#{student.phone}', '#{student.email}', '#{student.git}', '#{student.telegram}')"

    # Выполняем SQL-запрос
    @db.execute(sql)
    
    puts "Добавлен студент: #{student.name} #{student.surname}"
  end

  def update_student(id, updated_student)
    # Формируем SQL-запрос для обновления данных студента
    sql = "UPDATE student SET 
           surname = '#{updated_student.surname}', 
           name = '#{updated_student.name}', 
           patronymic = '#{updated_student.patronymic}', 
           birth_date = '#{updated_student.birth_date}', 
           phone = '#{updated_student.phone}', 
           email = '#{updated_student.email}', 
           git = '#{updated_student.git}', 
           telegram = '#{updated_student.telegram}' 
           WHERE id = #{id}"

    # Выполняем SQL-запрос
    @db.execute(sql)
    
    puts "Студент с ID #{id} обновлён."
  end

  def delete_student(id)
    @db.execute("DELETE FROM student WHERE id = '#{id}'")
    puts "Студент с ID #{id} удалён."
  end

  def get_student_count
    result = @db.query("SELECT COUNT(*) AS count FROM student")
    result.first['COUNT']
  end

  def get_all_students
    @db.query("SELECT * FROM student")
  end
end