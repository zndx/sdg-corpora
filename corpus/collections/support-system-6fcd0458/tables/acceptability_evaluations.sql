CREATE TABLE acceptability_evaluations (
  evaluation_id VARCHAR(44) NOT NULL,
  evaluation_date TIMESTAMP,
  risk_consideration_included BOOLEAN,
  result VARCHAR(32),
  evaluator_licensee_id INTEGER,
  alternate_temporary_system_id INTEGER,
  PRIMARY KEY (evaluation_id),
  FOREIGN KEY (alternate_temporary_system_id) REFERENCES alternate_temporary_systems (alternate_temporary_system_id)
);
