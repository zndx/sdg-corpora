CREATE TABLE states_recommendations (
  state_id INTEGER NOT NULL,
  u_p_r_recommendation_id INTEGER NOT NULL,
  PRIMARY KEY (state_id, u_p_r_recommendation_id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id)
);
