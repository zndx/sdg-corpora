CREATE TABLE microenterprises (
  microenterprise_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  legal_name VARCHAR(32),
  cluster_location VARCHAR(32),
  sector_type VARCHAR(32),
  registration_date DATE,
  is_demonstration_site BOOLEAN,
  project_activity_id INTEGER,
  r_e_c_p_practice_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (microenterprise_id),
  FOREIGN KEY (project_activity_id) REFERENCES project_activities (id),
  FOREIGN KEY (r_e_c_p_practice_id) REFERENCES r_e_c_p_practices (id)
);
