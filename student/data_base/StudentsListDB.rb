class StudentsListDB
  def initialize(db_connection)
    @db = db_connection
  end

  def get_student_by_id(id)
    result = @db.query("SELECT * FROM student WHERE id = #{id}")
    student_data = result.first
    if student_data
      student = Student.new(
        id: student_data['id'],
        surname: student_data['surname'],
        name: student_data['name'],
        patronymic: student_data['patronymic'],
        birth_date: student_data['birth_date'],
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
    surname = student.surname.force_encoding('UTF-8')
    name = student.name.force_encoding('UTF-8')
    patronymic = student.patronymic.force_encoding('UTF-8')
    birth_date = student.birth_date.is_a?(Date) ? student.birth_date.strftime('%Y-%m-%d') : student.birth_date
    phone = student.phone.force_encoding('UTF-8')
    email = student.email.force_encoding('UTF-8')
    git = student.git.force_encoding('UTF-8')
    telegram = student.telegram.force_encoding('UTF-8')
    @db.execute("INSERT INTO student (surname, name, patronymic, birth_date, phone, email, git, telegram) VALUES ('#{surname}', '#{name}', '#{patronymic}', TO_DATE('#{birth_date}', 'YYYY-MM-DD'), '#{phone}', '#{email}', '#{git}', '#{telegram}')")
  end

  def update_student(id, updated_student)
    id = updated_student.id.force_encoding('UTF-8')
    surname = updated_student.surname.force_encoding('UTF-8')
    name = updated_student.name.force_encoding('UTF-8')
    patronymic = updated_student.patronymic.force_encoding('UTF-8')
    birth_date = updated_student.birth_date.is_a?(Date) ? updated_student.birth_date.strftime('%Y-%m-%d') : updated_student.birth_date
    phone = updated_student.phone.force_encoding('UTF-8')
    email = updated_student.email.force_encoding('UTF-8')
    git = updated_student.git.force_encoding('UTF-8')
    telegram = updated_student.telegram.force_encoding('UTF-8')
    @db.execute("UPDATE student SET surname='#{surname}', name='#{name}', patronymic='#{patronymic}', birth_date=TO_DATE('#{birth_date}', 'YYYY-MM-DD'), phone='#{phone}', email='#{email}', git='#{git}', telegram='#{telegram}' WHERE id=#{id}")
  end

  def delete_student(id)
    @db.execute("DELETE FROM student WHERE id=#{id}")
  end

  def get_student_count
    result = @db.query("SELECT COUNT(*) AS count FROM student")
    result.first['COUNT']
  end
end