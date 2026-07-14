CREATE TABLE trials_sites (
  clinical_trial_id INTEGER NOT NULL,
  clinical_site_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_trial_id, clinical_site_id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (id)
);
