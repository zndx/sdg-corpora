CREATE TABLE programs_standards (
  school_library_program_id INTEGER NOT NULL,
  information_literacy_standard_id INTEGER NOT NULL,
  PRIMARY KEY (school_library_program_id, information_literacy_standard_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id),
  FOREIGN KEY (information_literacy_standard_id) REFERENCES information_literacy_standards (id)
);
