CREATE TABLE clinical_outcomes (
  clinical_outcome_id INTEGER NOT NULL,
  outcome_id VARCHAR(32),
  outcome_type VARCHAR(32),
  measurement_value DECIMAL,
  unit_of_measure VARCHAR(32),
  measurement_date DATE,
  trend VARCHAR(32),
  data_source VARCHAR(32),
  health_trust_id INTEGER,
  quality_workstream_id INTEGER,
  nursing_professional_id INTEGER,
  PRIMARY KEY (clinical_outcome_id),
  FOREIGN KEY (health_trust_id) REFERENCES health_trusts (health_trust_id),
  FOREIGN KEY (quality_workstream_id) REFERENCES quality_workstreams (quality_workstream_id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id)
);
