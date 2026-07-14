CREATE TABLE institutions_programs (
  research_institution_id INTEGER NOT NULL,
  cognitive_training_program_id INTEGER NOT NULL,
  PRIMARY KEY (research_institution_id, cognitive_training_program_id),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (research_institution_id),
  FOREIGN KEY (cognitive_training_program_id) REFERENCES cognitive_training_programs (id)
);
