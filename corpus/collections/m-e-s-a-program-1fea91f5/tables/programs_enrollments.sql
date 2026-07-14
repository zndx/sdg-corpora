CREATE TABLE programs_enrollments (
  m_e_s_a_program_id INTEGER NOT NULL,
  student_enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (m_e_s_a_program_id, student_enrollment_id),
  FOREIGN KEY (m_e_s_a_program_id) REFERENCES m_e_s_a_programs (id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id)
);
