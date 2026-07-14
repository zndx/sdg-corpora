CREATE TABLE sanctions (
  sanction_id INTEGER NOT NULL,
  sanction_type VARCHAR(32),
  severity_level INTEGER,
  is_regimented BOOLEAN,
  norm_id INTEGER,
  norm_violation_id INTEGER,
  agent_id INTEGER,
  PRIMARY KEY (sanction_id),
  FOREIGN KEY (norm_id) REFERENCES norms (id),
  FOREIGN KEY (norm_violation_id) REFERENCES norm_violations (id),
  FOREIGN KEY (agent_id) REFERENCES agents (id)
);
