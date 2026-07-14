CREATE TABLE programs_competencies (
  academic_program_id INTEGER NOT NULL,
  competency_id INTEGER NOT NULL,
  PRIMARY KEY (academic_program_id, competency_id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (id)
);
