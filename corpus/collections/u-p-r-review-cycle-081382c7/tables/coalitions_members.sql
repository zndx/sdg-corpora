CREATE TABLE coalitions_members (
  n_g_o_coalition_id INTEGER NOT NULL,
  n_g_o_member_id INTEGER NOT NULL,
  PRIMARY KEY (n_g_o_coalition_id, n_g_o_member_id),
  FOREIGN KEY (n_g_o_coalition_id) REFERENCES n_g_o_coalitions (n_g_o_coalition_id),
  FOREIGN KEY (n_g_o_member_id) REFERENCES n_g_o_members (n_g_o_member_id)
);
