CREATE TABLE trials_individuals (
  clinical_trial_id INTEGER NOT NULL,
  individual_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_trial_id, individual_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
