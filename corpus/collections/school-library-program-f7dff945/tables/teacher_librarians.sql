CREATE TABLE teacher_librarians (
  teacher_librarian_id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  certification_level VARCHAR(32),
  years_of_experience INTEGER,
  employment_status VARCHAR(32),
  specialization VARCHAR(32),
  hire_date DATE,
  school_library_program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (teacher_librarian_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id)
);
