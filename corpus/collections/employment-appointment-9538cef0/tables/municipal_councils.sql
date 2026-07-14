CREATE TABLE municipal_councils (
  municipal_council_id INTEGER NOT NULL,
  council_id VARCHAR(44),
  municipality_name VARCHAR(32),
  meeting_date TIMESTAMP,
  quorum_present BOOLEAN,
  session_type VARCHAR(32),
  agenda_items_count INTEGER,
  PRIMARY KEY (municipal_council_id)
);
