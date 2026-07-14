CREATE TABLE outcome_measures (
  id INTEGER NOT NULL,
  measure_id VARCHAR(32),
  name VARCHAR(32),
  type VARCHAR(32),
  unit VARCHAR(32),
  collection_method VARCHAR(32),
  clinical_trial_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id)
);
