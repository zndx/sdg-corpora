CREATE TABLE sites_trials (
  clinical_site_id INTEGER NOT NULL,
  clinical_trial_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_site_id, clinical_trial_id),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (id),
  FOREIGN KEY (clinical_trial_id) REFERENCES clinical_trials (clinical_trial_id)
);
