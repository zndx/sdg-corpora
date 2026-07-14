CREATE TABLE student_enrollments (
  student_enrollment_id INTEGER NOT NULL,
  enrollment_id VARCHAR(32),
  student_id VARCHAR(32),
  major VARCHAR(32),
  ethnicity VARCHAR(32),
  transfer_status VARCHAR(32),
  target_university VARCHAR(32),
  enrollment_date TIMESTAMP,
  graduation_date DATE,
  m_e_s_a_program_id INTEGER,
  four_year_university_id INTEGER,
  PRIMARY KEY (student_enrollment_id),
  FOREIGN KEY (m_e_s_a_program_id) REFERENCES m_e_s_a_programs (id),
  FOREIGN KEY (four_year_university_id) REFERENCES four_year_universities (four_year_university_id)
);
