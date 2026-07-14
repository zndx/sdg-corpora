CREATE TABLE academic_programs (
  academic_program_id INTEGER NOT NULL,
  program_code VARCHAR(32),
  program_name VARCHAR(32),
  qualification_level INTEGER,
  credit_hours DECIMAL,
  accreditation_status VARCHAR(32),
  learning_outcomes VARCHAR(32),
  university_code VARCHAR(44),
  quality_assurance_system_id INTEGER,
  PRIMARY KEY (academic_program_id),
  FOREIGN KEY (university_code) REFERENCES universities (university_code),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id)
);
