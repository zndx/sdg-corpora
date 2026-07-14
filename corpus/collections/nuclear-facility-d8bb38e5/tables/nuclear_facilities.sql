CREATE TABLE nuclear_facilities (
  facility_id VARCHAR(35) NOT NULL,
  facility_name VARCHAR(32),
  license_status VARCHAR(32),
  operational_status VARCHAR(32),
  site_type VARCHAR(32),
  last_inspection_date TIMESTAMP,
  director_id INTEGER,
  h_s_s_s_e_q_issue_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (facility_id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id),
  FOREIGN KEY (h_s_s_s_e_q_issue_id) REFERENCES h_s_s_s_e_q_issues (id)
);
