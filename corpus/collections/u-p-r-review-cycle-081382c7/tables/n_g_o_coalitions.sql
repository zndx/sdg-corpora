CREATE TABLE n_g_o_coalitions (
  n_g_o_coalition_id INTEGER NOT NULL,
  coalition_id VARCHAR(44),
  coalition_name VARCHAR(32),
  submission_date TIMESTAMP,
  submission_type VARCHAR(32),
  signatory_count INTEGER,
  u_p_r_review_cycle_id INTEGER,
  u_p_r_recommendation_id INTEGER,
  PRIMARY KEY (n_g_o_coalition_id),
  FOREIGN KEY (u_p_r_review_cycle_id) REFERENCES u_p_r_review_cycles (id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id)
);
