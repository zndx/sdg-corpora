CREATE TABLE survey_responses (
  survey_response_id INTEGER NOT NULL,
  response_id VARCHAR(35),
  survey_date TIMESTAMP,
  respondent_age INTEGER,
  respondent_gender VARCHAR(32),
  country VARCHAR(32),
  household_size INTEGER,
  is_sick_in_household BOOLEAN,
  religious_identity_id INTEGER,
  religious_practice_id INTEGER,
  traditional_healer_id INTEGER,
  sacred_object_id INTEGER,
  PRIMARY KEY (survey_response_id),
  FOREIGN KEY (religious_identity_id) REFERENCES religious_identities (religious_identity_id),
  FOREIGN KEY (religious_practice_id) REFERENCES religious_practices (religious_practice_id),
  FOREIGN KEY (traditional_healer_id) REFERENCES traditional_healers (id),
  FOREIGN KEY (sacred_object_id) REFERENCES sacred_objects (id)
);
