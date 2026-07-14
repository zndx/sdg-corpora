CREATE TABLE cognitive_capacities (
  cognitive_capacity_id INTEGER NOT NULL,
  capacity_identifier VARCHAR(32),
  capacity_name VARCHAR(32),
  domain VARCHAR(32),
  baseline_score DECIMAL,
  improvement_threshold DECIMAL,
  assessment_method VARCHAR(32),
  cognitive_training_program_id INTEGER,
  PRIMARY KEY (cognitive_capacity_id),
  FOREIGN KEY (cognitive_training_program_id) REFERENCES cognitive_training_programs (id)
);
