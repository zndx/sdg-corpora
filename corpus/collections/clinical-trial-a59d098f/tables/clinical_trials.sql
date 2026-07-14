CREATE TABLE clinical_trials (
  clinical_trial_id INTEGER NOT NULL,
  trial_identifier VARCHAR(32),
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  phase VARCHAR(32),
  primary_outcome VARCHAR(32),
  sample_size INTEGER,
  control_group_id VARCHAR(32),
  PRIMARY KEY (clinical_trial_id),
  FOREIGN KEY (control_group_id) REFERENCES control_groups (control_group_id)
);
