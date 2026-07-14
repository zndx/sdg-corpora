CREATE TABLE decision_topics (
  topic_id VARCHAR(40) NOT NULL,
  category_code VARCHAR(32),
  urgency_level INTEGER,
  description VARCHAR(32),
  best_interest_determination_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (topic_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
