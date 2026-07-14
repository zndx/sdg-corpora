CREATE TABLE award_tiers (
  id INTEGER NOT NULL,
  award_id VARCHAR(44),
  award_name VARCHAR(32),
  required_count INTEGER,
  ceremony_date DATE,
  status VARCHAR(32),
  reading_challenge_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (reading_challenge_id) REFERENCES reading_challenges (id)
);
