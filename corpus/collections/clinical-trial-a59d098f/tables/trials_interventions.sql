CREATE TABLE trials_interventions (
  clinical_trial_id INTEGER NOT NULL,
  intervention_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_trial_id, intervention_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id),
  FOREIGN KEY (intervention_id) REFERENCES interventions (intervention_id)
);
