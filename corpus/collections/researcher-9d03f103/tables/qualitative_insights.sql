CREATE TABLE qualitative_insights (
  id INTEGER NOT NULL,
  insight_id INTEGER,
  theme VARCHAR(32),
  sentiment VARCHAR(32),
  priority_level INTEGER,
  summary_text VARCHAR(32),
  telephone_interview_id INTEGER,
  policy_instrument_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (telephone_interview_id) REFERENCES telephone_interviews (id),
  FOREIGN KEY (policy_instrument_id) REFERENCES policy_instruments (id)
);
