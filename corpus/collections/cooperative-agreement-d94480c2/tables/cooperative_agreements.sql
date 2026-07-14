CREATE TABLE cooperative_agreements (
  cooperative_agreement_id INTEGER NOT NULL,
  agreement_identifier VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  description VARCHAR(32),
  communication_goal_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (cooperative_agreement_id),
  FOREIGN KEY (communication_goal_id) REFERENCES communication_goals (communication_goal_id)
);
