CREATE TABLE challenges_participants (
  reading_challenge_id INTEGER NOT NULL,
  participant_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (reading_challenge_id, participant_id),
  FOREIGN KEY (reading_challenge_id) REFERENCES reading_challenges (id),
  FOREIGN KEY (participant_id) REFERENCES reading_participants (participant_id)
);
