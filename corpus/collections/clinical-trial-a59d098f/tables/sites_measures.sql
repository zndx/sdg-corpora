CREATE TABLE sites_measures (
  clinical_site_id INTEGER NOT NULL,
  outcome_measure_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_site_id, outcome_measure_id),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (id),
  FOREIGN KEY (outcome_measure_id) REFERENCES outcome_measures (id)
);
