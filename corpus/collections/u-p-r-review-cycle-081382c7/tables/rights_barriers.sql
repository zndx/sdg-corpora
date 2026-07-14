CREATE TABLE rights_barriers (
  rights_barrier_id INTEGER NOT NULL,
  barrier_id VARCHAR(32),
  barrier_type VARCHAR(32),
  severity_level VARCHAR(32),
  documented_evidence VARCHAR(32),
  mitigation_status VARCHAR(32),
  vulnerable_group_id INTEGER,
  u_p_r_recommendation_id INTEGER,
  state_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (rights_barrier_id),
  FOREIGN KEY (vulnerable_group_id) REFERENCES vulnerable_groups (id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
