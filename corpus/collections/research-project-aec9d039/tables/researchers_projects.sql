CREATE TABLE researchers_projects (
  researcher_id INTEGER NOT NULL,
  research_project_id INTEGER NOT NULL,
  PRIMARY KEY (researcher_id, research_project_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id)
);
