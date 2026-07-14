CREATE TABLE analytics_solutions (
  id INTEGER NOT NULL,
  solution_id INTEGER,
  name VARCHAR(32),
  type VARCHAR(32),
  provider VARCHAR(32),
  deployment_date DATE,
  is_web_based BOOLEAN,
  healthcare_organization_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_organization_id) REFERENCES healthcare_organizations (id)
);
