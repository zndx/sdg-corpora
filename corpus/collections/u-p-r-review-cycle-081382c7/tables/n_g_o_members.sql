CREATE TABLE n_g_o_members (
  n_g_o_member_id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  focus_area VARCHAR(32),
  registration_country VARCHAR(32),
  n_g_o_coalition_id INTEGER,
  u_p_r_recommendation_id INTEGER,
  state_id INTEGER,
  PRIMARY KEY (n_g_o_member_id),
  FOREIGN KEY (n_g_o_coalition_id) REFERENCES n_g_o_coalitions (n_g_o_coalition_id),
  FOREIGN KEY (u_p_r_recommendation_id) REFERENCES u_p_r_recommendations (id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
