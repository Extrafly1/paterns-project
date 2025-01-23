class StudentsListDB
  def initialize(database_connection)
    @db = database_connection
  end

  def get_student_by_id(id)

    result = @db.query("SELECT * FROM student WHERE id = '#{id}'")
    student_data = result.first
    if student_data

      birth_date = student_data['birth_date'].to_s

      student = Student.new(
        id: student_data['id'],
        surname: student_data['surname'],
        name: student_data['name'],
        patronymic: student_data['patronymic'],
        birth_date: birth_date,
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

  def get_k_n_student_list(k, n)
    offset = (k - 1) * n
    query = <<-SQL
      SELECT * FROM student
      ORDER BY id
      OFFSET #{offset} ROWS
      FETCH NEXT #{n} ROWS ONLY
    SQL

    result = @db.query(query)
    result.map do |row|
      Student.new(
        id: row['id'],
        surname: row['surname'],
        name: row['name'],
        patronymic: row['patronymic'],
        birth_date: row['birth_date'].to_s,
        phone: row['phone'],
        email: row['email'],
        git: row['git'],
        telegram: row['telegram']
      )
    end
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    query = <<-SQL
      SELECT * FROM student
      ORDER BY id
      OFFSET #{offset} ROWS
      FETCH NEXT #{n} ROWS ONLY
    SQL

    result = @db.query(query)
    result.map do |row|
      student = Student.new(
        id: row['id'],
        surname: row['surname'],
        name: row['name'],
        patronymic: row['patronymic'],
        birth_date: row['birth_date'].to_s,
        phone: row['phone'],
        email: row['email'],
        git: row['git'],
        telegram: row['telegram']
      )
      Student_short.create_from_student(student)
    end
  end

  def add_student(student)
    sql = "INSERT INTO student (surname, name, patronymic, birth_date, phone, email, git, telegram) 
           VALUES ('#{student.surname}', '#{student.name}', '#{student.patronymic}', '#{student.birth_date}', 
           '#{student.phone}', '#{student.email}', '#{student.git}', '#{student.telegram}')"

    @db.execute(sql)
    
  end

  def update_student(id, updated_student)
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

    @db.execute(sql)
    
  end

  def delete_student(id)
    @db.execute("DELETE FROM student WHERE id = '#{id}'")
  end

  def get_student_count
    result = @db.query("SELECT COUNT(*) AS count FROM student")
    result.first['COUNT']
  end

  def get_all_students
    @db.query("SELECT * FROM student")
  end
end