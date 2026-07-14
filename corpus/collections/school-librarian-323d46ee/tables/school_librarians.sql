CREATE TABLE school_librarians (
  librarian_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  employment_status VARCHAR(32),
  certification_level VARCHAR(32),
  years_of_experience INTEGER,
  current_role VARCHAR(32),
  library_program_id INTEGER,
  PRIMARY KEY (librarian_id),
  FOREIGN KEY (library_program_id) REFERENCES library_programs (library_program_id)
);
