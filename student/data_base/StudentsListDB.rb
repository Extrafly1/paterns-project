class StudentsListDB
  def initialize(db_connection)
    @db = db_connection
  end

  def get_student_by_id(id)
    result = @db.query("SELECT * FROM student WHERE id = #{id}")
    result.first
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    result = @db.query("SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM student ORDER BY id) a WHERE ROWNUM <= #{offset + n}) WHERE rnum > #{offset}")
    result.map { |row| Student_short.new(row) }
  end

  def add_student(student)
    @db.execute("INSERT INTO student (surname, name, patronymic, birth_date, phone, email, git, telegram) VALUES ('#{student.surname}', '#{student.name}', '#{student.patronymic}', TO_DATE('#{student.birth_date}', 'YYYY-MM-DD'), '#{student.phone}', '#{student.email}', '#{student.git}', '#{student.telegram}')")
    result = @db.query("SELECT student_seq.CURRVAL FROM dual")
    result.first['CURRVAL']
  end

  def update_student(id, updated_student)
    @db.execute("UPDATE student SET surname='#{updated_student.surname}', name='#{updated_student.name}', patronymic='#{updated_student.patronymic}', birth_date=TO_DATE('#{updated_student.birth_date}', 'YYYY-MM-DD'), phone='#{updated_student.phone}', email='#{updated_student.email}', git='#{updated_student.git}', telegram='#{updated_student.telegram}' WHERE id=#{id}")
  end

  def delete_student(id)
    @db.execute("DELETE FROM student WHERE id=#{id}")
  end

  def get_student_count
    result = @db.query("SELECT COUNT(*) AS count FROM student")
    result.first['COUNT']
  end
end