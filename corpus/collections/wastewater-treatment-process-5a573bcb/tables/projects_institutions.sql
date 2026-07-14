CREATE TABLE projects_institutions (
  research_project_id INTEGER NOT NULL,
  research_institution_id INTEGER NOT NULL,
  PRIMARY KEY (research_project_id, research_institution_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (id)
);
