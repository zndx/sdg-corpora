CREATE TABLE studies_factors (
  empirical_study_id INTEGER NOT NULL,
  success_factor_id INTEGER NOT NULL,
  PRIMARY KEY (empirical_study_id, success_factor_id),
  FOREIGN KEY (empirical_study_id) REFERENCES empirical_studies (id),
  FOREIGN KEY (success_factor_id) REFERENCES success_factors (success_factor_id)
);
