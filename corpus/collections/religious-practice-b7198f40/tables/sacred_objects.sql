CREATE TABLE sacred_objects (
  id INTEGER NOT NULL,
  object_id VARCHAR(38),
  object_type VARCHAR(32),
  protective_purpose VARCHAR(32),
  is_kept_at_home BOOLEAN,
  survey_response_id INTEGER,
  religious_practice_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (survey_response_id),
  FOREIGN KEY (religious_practice_id) REFERENCES religious_practices (religious_practice_id)
);
