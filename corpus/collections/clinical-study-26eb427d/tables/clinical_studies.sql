CREATE TABLE clinical_studies (
  clinical_study_id INTEGER NOT NULL,
  study_id VARCHAR(32),
  title VARCHAR(32),
  status VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  funding_agency VARCHAR(32),
  primary_objective VARCHAR(32),
  researcher_id INTEGER,
  funding_award_id INTEGER,
  PRIMARY KEY (clinical_study_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (funding_award_id) REFERENCES funding_awards (funding_award_id)
);
