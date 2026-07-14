CREATE TABLE students_programs (
  student_id VARCHAR(32) NOT NULL,
  school_library_program_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, school_library_program_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id)
);
