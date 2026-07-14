CREATE TABLE reading_participants (
  participant_id VARCHAR(44) NOT NULL,
  full_name VARCHAR(36),
  year_group VARCHAR(32),
  enrollment_date DATE,
  status VARCHAR(32),
  reading_challenge_id INTEGER,
  PRIMARY KEY (participant_id),
  FOREIGN KEY (reading_challenge_id) REFERENCES reading_challenges (id)
);
