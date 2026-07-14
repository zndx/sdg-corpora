CREATE TABLE programs_librarians (
  school_library_program_id INTEGER NOT NULL,
  teacher_librarian_id INTEGER NOT NULL,
  PRIMARY KEY (school_library_program_id, teacher_librarian_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id),
  FOREIGN KEY (teacher_librarian_id) REFERENCES teacher_librarians (teacher_librarian_id)
);
