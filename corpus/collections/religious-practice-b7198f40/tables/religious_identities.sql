CREATE TABLE religious_identities (
  religious_identity_id INTEGER NOT NULL,
  identity_id VARCHAR(44),
  identity_label VARCHAR(32),
  is_primary BOOLEAN,
  adherence_level VARCHAR(32),
  survey_response_id INTEGER,
  religious_practice_id INTEGER,
  PRIMARY KEY (religious_identity_id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (survey_response_id),
  FOREIGN KEY (religious_practice_id) REFERENCES religious_practices (religious_practice_id)
);
