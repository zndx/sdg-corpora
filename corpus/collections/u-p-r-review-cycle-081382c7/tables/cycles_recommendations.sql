CREATE TABLE cycles_recommendations (
  u_p_r_review_cycle_id INTEGER NOT NULL,
  u_p_r_recommendation_id INTEGER NOT NULL,
  PRIMARY KEY (u_p_r_review_cycle_id, u_p_r_recommendation_id),
  FOREIGN KEY (u_p_r_review_cycle_id) REFERENCES u_p_r_review_cycles (id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id)
);
