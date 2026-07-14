CREATE TABLE migr_survey_responsesMigrant (
  survey_response_id INTEGER NOT NULL,
  migrant_id INTEGER NOT NULL,
  PRIMARY KEY (survey_response_id, migrant_id),
  FOREIGN KEY (survey_response_id) REFERENCES migr_survey_responses (id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id)
);
