CREATE TABLE leaders_advisors (
  executive_leader_id INTEGER NOT NULL,
  e_s_g_advisor_id INTEGER NOT NULL,
  PRIMARY KEY (executive_leader_id, e_s_g_advisor_id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id)
);
