CREATE TABLE coaches_engagements (
  coach_id INTEGER NOT NULL,
  coaching_engagement_id INTEGER NOT NULL,
  PRIMARY KEY (coach_id, coaching_engagement_id),
  FOREIGN KEY (coach_id) REFERENCES coaches (id),
  FOREIGN KEY (coaching_engagement_id) REFERENCES coaching_engagements (coaching_engagement_id)
);
