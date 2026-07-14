CREATE TABLE objectives_instruments (
  objective_id VARCHAR(44) NOT NULL,
  assessment_instrument_id INTEGER NOT NULL,
  PRIMARY KEY (objective_id, assessment_instrument_id),
  FOREIGN KEY (objective_id) REFERENCES instructional_objectives (objective_id),
  FOREIGN KEY (assessment_instrument_id) REFERENCES assessment_instruments (assessment_instrument_id)
);
