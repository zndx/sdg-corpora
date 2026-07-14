CREATE TABLE u_p_r_recommendations (
  id INTEGER NOT NULL,
  recommendation_id VARCHAR(44),
  recommendation_text VARCHAR(32),
  topic_area VARCHAR(32),
  acceptance_status VARCHAR(32),
  priority_level VARCHAR(32),
  u_p_r_review_cycle_id INTEGER,
  state_id INTEGER,
  vulnerable_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (u_p_r_review_cycle_id) REFERENCES u_p_r_review_cycles (id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  FOREIGN KEY (vulnerable_group_id) REFERENCES vulnerable_groups (id)
);
