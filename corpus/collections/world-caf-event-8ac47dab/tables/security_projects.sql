CREATE TABLE security_projects (
  id INTEGER NOT NULL,
  project_identifier VARCHAR(32),
  project_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  funding_source VARCHAR(32),
  status VARCHAR(32),
  objectives VARCHAR(32),
  PRIMARY KEY (id)
);
