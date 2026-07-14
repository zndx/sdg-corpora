CREATE TABLE migr_survey_responses (
  id INTEGER NOT NULL,
  response_id VARCHAR(35),
  survey_date DATE,
  respondent_type VARCHAR(32),
  perception_score INTEGER,
  integration_assessment VARCHAR(32),
  language_barrier_perception BOOLEAN,
  local_id INTEGER,
  migrant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (local_id) REFERENCES migr_locals (id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id)
);
