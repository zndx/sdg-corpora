CREATE TABLE projects_reports (
  security_project_id INTEGER NOT NULL,
  project_report_id INTEGER NOT NULL,
  PRIMARY KEY (security_project_id, project_report_id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id),
  FOREIGN KEY (project_report_id) REFERENCES project_reports (project_report_id)
);
