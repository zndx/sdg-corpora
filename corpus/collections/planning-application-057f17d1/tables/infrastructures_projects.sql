CREATE TABLE infrastructures_projects (
  infrastructure_infra_id INTEGER NOT NULL,
  development_project_id INTEGER NOT NULL,
  PRIMARY KEY (infrastructure_infra_id, development_project_id),
  FOREIGN KEY (infrastructure_infra_id) REFERENCES infrastructures (infra_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (development_project_id)
);
