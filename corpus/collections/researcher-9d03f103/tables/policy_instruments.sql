CREATE TABLE policy_instruments (
  id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  instrument_name VARCHAR(32),
  launch_date DATE,
  status VARCHAR(32),
  target_group VARCHAR(32),
  researcher_id INTEGER,
  response_id VARCHAR(35),
  telephone_interview_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (response_id) REFERENCES survey_responses (response_id),
  FOREIGN KEY (telephone_interview_id) REFERENCES telephone_interviews (id)
);
