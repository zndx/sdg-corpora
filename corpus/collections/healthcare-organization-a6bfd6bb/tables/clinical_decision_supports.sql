CREATE TABLE clinical_decision_supports (
  cds_id VARCHAR(44) NOT NULL,
  trigger_condition VARCHAR(32),
  recommendation VARCHAR(32),
  effectiveness_score DECIMAL,
  last_updated TIMESTAMP,
  is_proactive BOOLEAN,
  analytics_solution_id INTEGER,
  PRIMARY KEY (cds_id),
  FOREIGN KEY (analytics_solution_id) REFERENCES analytics_solutions (id)
);
