CREATE TABLE policies (
  policy_id INTEGER NOT NULL,
  policy_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  organization_id INTEGER,
  strategic_objective_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (policy_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (strategic_objective_id) REFERENCES strategic_objectives (id)
);
