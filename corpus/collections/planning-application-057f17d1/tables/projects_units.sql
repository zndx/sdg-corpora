CREATE TABLE projects_units (
  development_project_id INTEGER NOT NULL,
  unit_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (development_project_id, unit_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (development_project_id),
  FOREIGN KEY (unit_id) REFERENCES housing_units (unit_id)
);
