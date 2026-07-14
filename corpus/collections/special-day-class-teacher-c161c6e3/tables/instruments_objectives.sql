CREATE TABLE instruments_objectives (
  assessment_instrument_id INTEGER NOT NULL,
  objective_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (assessment_instrument_id, objective_id),
  FOREIGN KEY (assessment_instrument_id) REFERENCES assessment_instruments (assessment_instrument_id),
  FOREIGN KEY (objective_id) REFERENCES instructional_objectives (objective_id)
);
