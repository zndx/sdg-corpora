CREATE TABLE clients (
  id INTEGER NOT NULL,
  client_id VARCHAR(32),
  full_name VARCHAR(36),
  occupation VARCHAR(32),
  industry VARCHAR(32),
  coaching_needs VARCHAR(32),
  client_since DATE,
  coaching_engagement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (coaching_engagement_id) REFERENCES coaching_engagements (coaching_engagement_id)
);
