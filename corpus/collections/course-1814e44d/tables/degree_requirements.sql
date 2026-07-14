CREATE TABLE degree_requirements (
  degree_requirement_id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  title VARCHAR(32),
  category VARCHAR(32),
  min_courses INTEGER,
  status VARCHAR(32),
  academic_program_id INTEGER,
  PRIMARY KEY (degree_requirement_id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id)
);
