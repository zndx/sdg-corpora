CREATE TABLE standards_programs (
  information_literacy_standard_id INTEGER NOT NULL,
  school_library_program_id INTEGER NOT NULL,
  PRIMARY KEY (information_literacy_standard_id, school_library_program_id),
  FOREIGN KEY (information_literacy_standard_id) REFERENCES information_literacy_standards (id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id)
);
