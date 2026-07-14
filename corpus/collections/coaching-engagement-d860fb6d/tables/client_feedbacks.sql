CREATE TABLE client_feedbacks (
  client_feedback_id INTEGER NOT NULL,
  feedback_id VARCHAR(32),
  feedback_date DATE,
  rating INTEGER,
  testimonial VARCHAR(32),
  sentiment VARCHAR(32),
  client_id INTEGER,
  coaching_engagement_id INTEGER,
  PRIMARY KEY (client_feedback_id),
  FOREIGN KEY (client_id) REFERENCES clients (id),
  FOREIGN KEY (coaching_engagement_id) REFERENCES coaching_engagements (coaching_engagement_id)
);
