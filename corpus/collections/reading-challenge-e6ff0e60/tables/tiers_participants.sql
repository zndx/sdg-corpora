CREATE TABLE tiers_participants (
  award_tier_id INTEGER NOT NULL,
  participant_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (award_tier_id, participant_id),
  FOREIGN KEY (award_tier_id) REFERENCES award_tiers (id),
  FOREIGN KEY (participant_id) REFERENCES reading_participants (participant_id)
);
