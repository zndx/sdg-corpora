CREATE TABLE leaders_reports (
  executive_leader_id INTEGER NOT NULL,
  report_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (executive_leader_id, report_id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id)
);
