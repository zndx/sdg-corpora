CREATE TABLE agents (
  id INTEGER NOT NULL,
  agent_id VARCHAR(44),
  agent_type VARCHAR(32),
  current_sanction_count INTEGER,
  max_allowed_sanctions INTEGER,
  norm_id INTEGER,
  transition_id VARCHAR(32),
  sanction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (norm_id) REFERENCES norms (id),
  FOREIGN KEY (transition_id) REFERENCES transitions (transition_id),
  FOREIGN KEY (sanction_id) REFERENCES sanctions (sanction_id)
);
