CREATE TABLE control_groups (
  control_group_id VARCHAR(32) NOT NULL,
  type VARCHAR(32),
  size INTEGER,
  clinical_trial_id INTEGER,
  control_intervention_id INTEGER,
  PRIMARY KEY (control_group_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id),
  FOREIGN KEY (control_intervention_id) REFERENCES control_interventions (control_intervention_id)
);
