CREATE TABLE trained_speakers (
  id INTEGER NOT NULL,
  speaker_identifier VARCHAR(32),
  full_name VARCHAR(36),
  training_completion_date DATE,
  specialization VARCHAR(32),
  presentation_count INTEGER,
  is_available BOOLEAN,
  bio_url VARCHAR(55),
  mental_health_issue_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (mental_health_issue_id) REFERENCES mental_health_issues (mental_health_issue_id)
);
