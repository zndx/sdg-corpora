CREATE TABLE carbon_credits (
  id INTEGER NOT NULL,
  credit_id VARCHAR(35),
  standard VARCHAR(32),
  issue_date DATE,
  volume_tonnes_c_o2 DECIMAL,
  revenue_u_s_d DECIMAL,
  project_type VARCHAR(32),
  forest_plantation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (forest_plantation_id) REFERENCES forest_plantations (id)
);
