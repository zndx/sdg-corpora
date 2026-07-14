CREATE TABLE programs_students (
  school_library_program_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (school_library_program_id, student_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
