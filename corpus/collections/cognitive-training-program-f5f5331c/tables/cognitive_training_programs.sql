CREATE TABLE cognitive_training_programs (
  id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  target_capacity VARCHAR(32),
  delivery_mode VARCHAR(32),
  target_population VARCHAR(35),
  evidence_level VARCHAR(32),
  launch_date TIMESTAMP,
  research_institution_id INTEGER,
  cognitive_assessment_administrator_i_d VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (research_institution_id),
  FOREIGN KEY (cognitive_assessment_administrator_i_d) REFERENCES cognitive_assessments (administrator_i_d)
);
