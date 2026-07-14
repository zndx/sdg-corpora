CREATE TABLE competition_divisions (
  division_id VARCHAR(32) NOT NULL,
  division_name VARCHAR(32),
  age_category VARCHAR(32),
  rank_requirement VARCHAR(32),
  event_type VARCHAR(32),
  rule_set VARCHAR(32),
  head_contact_allowed VARCHAR(32),
  competition_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (division_id),
  FOREIGN KEY (competition_id) REFERENCES competitions (id)
);
