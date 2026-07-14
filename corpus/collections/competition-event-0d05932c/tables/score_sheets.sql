CREATE TABLE score_sheets (
  score_sheet_id INTEGER NOT NULL,
  score_sheet_version VARCHAR(32),
  total_max_points DECIMAL,
  safety_scope_included BOOLEAN,
  is_sample BOOLEAN,
  last_updated TIMESTAMP,
  assessment_id INTEGER,
  competition_event_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (score_sheet_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (assessment_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id)
);
