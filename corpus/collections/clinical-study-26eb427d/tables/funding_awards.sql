CREATE TABLE funding_awards (
  funding_award_id INTEGER NOT NULL,
  award_id VARCHAR(44),
  award_date DATE,
  total_amount VARCHAR(32),
  duration_months INTEGER,
  status VARCHAR(32),
  clinical_study_id INTEGER,
  funding_agency_id INTEGER,
  PRIMARY KEY (funding_award_id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id)
);
