CREATE TABLE researchers (
  researcher_id INTEGER NOT NULL,
  nationality VARCHAR(32),
  career_stage VARCHAR(32),
  gender VARCHAR(32),
  sector VARCHAR(32),
  primary_field VARCHAR(32),
  geographic_location_id INTEGER,
  response_id VARCHAR(35),
  telephone_interview_id INTEGER,
  PRIMARY KEY (researcher_id),
  FOREIGN KEY (geographic_location_id) REFERENCES geographic_locations (id),
  FOREIGN KEY (response_id) REFERENCES survey_responses (response_id),
  FOREIGN KEY (telephone_interview_id) REFERENCES telephone_interviews (id)
);
