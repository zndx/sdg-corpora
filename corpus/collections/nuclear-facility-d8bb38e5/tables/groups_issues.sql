CREATE TABLE groups_issues (
  sub_group_id INTEGER NOT NULL,
  h_s_s_s_e_q_issue_id INTEGER NOT NULL,
  PRIMARY KEY (sub_group_id, h_s_s_s_e_q_issue_id),
  FOREIGN KEY (sub_group_id) REFERENCES sub_groups (id),
  FOREIGN KEY (h_s_s_s_e_q_issue_id) REFERENCES h_s_s_s_e_q_issues (id)
);
