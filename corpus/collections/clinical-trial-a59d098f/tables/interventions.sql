CREATE TABLE interventions (
  intervention_id INTEGER NOT NULL,
  name VARCHAR(32),
  dosage DECIMAL,
  unit VARCHAR(32),
  frequency VARCHAR(32),
  route VARCHAR(32),
  clinical_trial_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (intervention_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id)
);
