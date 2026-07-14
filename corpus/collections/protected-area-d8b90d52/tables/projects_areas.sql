CREATE TABLE projects_areas (
  project_id INTEGER NOT NULL,
  protected_area_id INTEGER NOT NULL,
  PRIMARY KEY (project_id, protected_area_id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (protected_area_id) REFERENCES protected_areas (id)
);
