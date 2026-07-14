CREATE TABLE assessments (
  assessment_id INTEGER NOT NULL,
  assessment_type VARCHAR(32),
  duration_minutes INTEGER,
  score_weight_percentage DECIMAL,
  max_score DECIMAL,
  assessment_status VARCHAR(32),
  competition_event_id INTEGER,
  PRIMARY KEY (assessment_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id)
);
