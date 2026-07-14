CREATE TABLE projects_researchers (
  research_project_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (research_project_id, researcher_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id)
);
