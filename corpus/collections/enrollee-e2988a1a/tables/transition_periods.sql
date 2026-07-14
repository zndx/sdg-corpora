CREATE TABLE transition_periods (
  transition_period_id INTEGER NOT NULL,
  period_id VARCHAR(44),
  start_date DATE,
  end_date DATE,
  duration_days INTEGER,
  status VARCHAR(32),
  enrollee_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (transition_period_id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (id)
);
