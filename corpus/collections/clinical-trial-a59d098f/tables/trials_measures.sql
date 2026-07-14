CREATE TABLE trials_measures (
  clinical_trial_id INTEGER NOT NULL,
  outcome_measure_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_trial_id, outcome_measure_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id),
  FOREIGN KEY (outcome_measure_id) REFERENCES outcome_measures (id)
);
