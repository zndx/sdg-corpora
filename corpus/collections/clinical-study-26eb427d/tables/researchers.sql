CREATE TABLE researchers (
  id INTEGER NOT NULL,
  researcher_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  affiliation VARCHAR(32),
  credentials VARCHAR(32),
  clinical_study_id INTEGER,
  collaborates_with_researcher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id),
  FOREIGN KEY (collaborates_with_researcher_id) REFERENCES researchers (id)
);
