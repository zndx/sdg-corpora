CREATE TABLE projects_units (
  project_id INTEGER NOT NULL,
  management_unit_id INTEGER NOT NULL,
  PRIMARY KEY (project_id, management_unit_id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (management_unit_id) REFERENCES management_units (id)
);
