CREATE TABLE alternate_temporary_systems (
  alternate_temporary_system_id INTEGER NOT NULL,
  ats_identifier VARCHAR(32),
  deployment_date TIMESTAMP,
  removal_date TIMESTAMP,
  acceptability_status VARCHAR(32),
  evaluation_criteria_met BOOLEAN,
  support_system_id INTEGER,
  evaluation_id VARCHAR(44),
  PRIMARY KEY (alternate_temporary_system_id),
  FOREIGN KEY (support_system_id) REFERENCES support_systems (support_system_id),
  FOREIGN KEY (evaluation_id) REFERENCES acceptability_evaluations (evaluation_id)
);
