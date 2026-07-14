CREATE TABLE coaching_topics (
  id INTEGER NOT NULL,
  topic_id VARCHAR(40),
  topic_name VARCHAR(32),
  description VARCHAR(32),
  category VARCHAR(32),
  coaching_engagement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (coaching_engagement_id) REFERENCES coaching_engagements (coaching_engagement_id)
);
