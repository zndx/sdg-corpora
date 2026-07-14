CREATE TABLE strategic_objectives (
  id INTEGER NOT NULL,
  objective_id VARCHAR(44),
  objective_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  organization_id INTEGER,
  project_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id)
);
