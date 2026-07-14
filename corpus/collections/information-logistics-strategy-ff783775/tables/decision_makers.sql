CREATE TABLE decision_makers (
  decision_maker_id INTEGER NOT NULL,
  stakeholder_identifier VARCHAR(32),
  role_title VARCHAR(32),
  decision_frequency VARCHAR(32),
  information_requirement_level VARCHAR(32),
  satisfaction_score DECIMAL,
  organizational_unit_id INTEGER,
  performance_metric_id INTEGER,
  PRIMARY KEY (decision_maker_id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id)
);
