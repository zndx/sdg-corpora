CREATE TABLE h_s_s_s_e_q_issues (
  id INTEGER NOT NULL,
  issue_id VARCHAR(44),
  issue_title VARCHAR(32),
  category VARCHAR(32),
  risk_level VARCHAR(32),
  status VARCHAR(32),
  reported_date TIMESTAMP,
  facility_id VARCHAR(35),
  sub_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facility_id) REFERENCES nuclear_facilities (facility_id),
  FOREIGN KEY (sub_group_id) REFERENCES sub_groups (id)
);
