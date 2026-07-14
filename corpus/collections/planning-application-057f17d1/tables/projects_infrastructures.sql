CREATE TABLE projects_infrastructures (
  development_project_id INTEGER NOT NULL,
  infrastructure_infra_id INTEGER NOT NULL,
  PRIMARY KEY (development_project_id, infrastructure_infra_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (development_project_id),
  FOREIGN KEY (infrastructure_infra_id) REFERENCES infrastructures (infra_id)
);
