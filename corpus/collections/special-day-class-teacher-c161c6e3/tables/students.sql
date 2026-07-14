CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  enrollment_status VARCHAR(32),
  disability_type VARCHAR(32),
  iep_status VARCHAR(32),
  date_of_birth DATE,
  grade_level INTEGER,
  primary_language VARCHAR(32),
  individualized_education_program_iep_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (individualized_education_program_iep_id) REFERENCES individualized_education_programs (iep_id)
);
