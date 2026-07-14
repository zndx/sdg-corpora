CREATE TABLE challenges_tiers (
  reading_challenge_id INTEGER NOT NULL,
  award_tier_id INTEGER NOT NULL,
  PRIMARY KEY (reading_challenge_id, award_tier_id),
  FOREIGN KEY (reading_challenge_id) REFERENCES reading_challenges (id),
  FOREIGN KEY (award_tier_id) REFERENCES award_tiers (id)
);
