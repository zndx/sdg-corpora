CREATE TABLE norm_violations (
  id INTEGER NOT NULL,
  violation_id VARCHAR(32),
  violation_timestamp TIMESTAMP,
  violation_type VARCHAR(32),
  sanction_incurment BOOLEAN,
  norm_id INTEGER,
  state_id INTEGER,
  sanction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (norm_id) REFERENCES norms (id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  FOREIGN KEY (sanction_id) REFERENCES sanctions (sanction_id)
);
