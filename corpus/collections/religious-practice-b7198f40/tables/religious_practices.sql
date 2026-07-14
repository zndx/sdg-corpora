CREATE TABLE religious_practices (
  religious_practice_id INTEGER NOT NULL,
  practice_id VARCHAR(44),
  practice_name VARCHAR(32),
  practice_type VARCHAR(32),
  prevalence_percentage DECIMAL,
  region VARCHAR(32),
  is_syncretic BOOLEAN,
  survey_response_id INTEGER,
  religious_identity_id INTEGER,
  PRIMARY KEY (religious_practice_id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (survey_response_id),
  FOREIGN KEY (religious_identity_id) REFERENCES religious_identities (religious_identity_id)
);
