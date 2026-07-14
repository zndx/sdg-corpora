CREATE TABLE survey_responses (
  response_id VARCHAR(35) NOT NULL,
  submission_date TIMESTAMP,
  respondent_status VARCHAR(32),
  total_score DECIMAL,
  completion_status VARCHAR(32),
  researcher_id INTEGER,
  policy_instrument_id INTEGER,
  PRIMARY KEY (response_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (policy_instrument_id) REFERENCES policy_instruments (id)
);
