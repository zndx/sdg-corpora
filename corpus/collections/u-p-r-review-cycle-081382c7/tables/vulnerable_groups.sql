CREATE TABLE vulnerable_groups (
  id INTEGER NOT NULL,
  group_identifier VARCHAR(32),
  group_name VARCHAR(32),
  risk_category VARCHAR(32),
  geographic_distribution VARCHAR(32),
  population_size INTEGER,
  u_p_r_recommendation_id INTEGER,
  state_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
