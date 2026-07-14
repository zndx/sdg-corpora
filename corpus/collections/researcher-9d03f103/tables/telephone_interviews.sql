CREATE TABLE telephone_interviews (
  id INTEGER NOT NULL,
  interview_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  duration_minutes INTEGER,
  interviewer_id VARCHAR(32),
  researcher_id INTEGER,
  geographic_location_id INTEGER,
  qualitative_insight_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (geographic_location_id) REFERENCES geographic_locations (id),
  FOREIGN KEY (qualitative_insight_id) REFERENCES qualitative_insights (id)
);
