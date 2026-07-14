CREATE TABLE projects_areas (
  project_code VARCHAR(44) NOT NULL,
  protected_area_id INTEGER NOT NULL,
  PRIMARY KEY (project_code, protected_area_id),
  FOREIGN KEY (project_code) REFERENCES joint_european_projects (project_code),
  FOREIGN KEY (protected_area_id) REFERENCES protected_areas (protected_area_id)
);
