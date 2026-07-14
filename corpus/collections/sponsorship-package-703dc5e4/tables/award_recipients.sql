CREATE TABLE award_recipients (
  id INTEGER NOT NULL,
  recipient_id VARCHAR(40),
  recipient_name VARCHAR(32),
  award_category VARCHAR(35),
  years_in_field INTEGER,
  nomination_year INTEGER,
  is_finalist BOOLEAN,
  is_winner BOOLEAN,
  major_event_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (major_event_id) REFERENCES major_events (id)
);
