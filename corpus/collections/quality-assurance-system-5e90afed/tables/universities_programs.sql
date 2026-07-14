CREATE TABLE universities_programs (
  university_code VARCHAR(44) NOT NULL,
  academic_program_id INTEGER NOT NULL,
  PRIMARY KEY (university_code, academic_program_id),
  FOREIGN KEY (university_code) REFERENCES universities (university_code),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id)
);
