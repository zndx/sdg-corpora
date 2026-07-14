CREATE TABLE events_assessments (
  competition_event_id INTEGER NOT NULL,
  assessment_id INTEGER NOT NULL,
  PRIMARY KEY (competition_event_id, assessment_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (assessment_id)
);
