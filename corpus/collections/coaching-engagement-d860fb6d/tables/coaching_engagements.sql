CREATE TABLE coaching_engagements (
  coaching_engagement_id INTEGER NOT NULL,
  engagement_id INTEGER,
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  session_count INTEGER,
  coaching_goal VARCHAR(32),
  coach_id INTEGER,
  client_id INTEGER,
  coaching_topic_id INTEGER,
  PRIMARY KEY (coaching_engagement_id),
  FOREIGN KEY (coach_id) REFERENCES coaches (id),
  FOREIGN KEY (client_id) REFERENCES clients (id),
  FOREIGN KEY (coaching_topic_id) REFERENCES coaching_topics (id)
);
