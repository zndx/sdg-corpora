CREATE TABLE projects (
  id INTEGER NOT NULL,
  project_id VARCHAR(44),
  project_title VARCHAR(32),
  start_date DATE,
  end_date DATE,
  project_type VARCHAR(32),
  description VARCHAR(32),
  resource_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (resource_id) REFERENCES external_resources (resource_id)
);
