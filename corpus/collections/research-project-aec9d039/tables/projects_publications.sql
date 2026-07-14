CREATE TABLE projects_publications (
  research_project_id INTEGER NOT NULL,
  publication_id INTEGER NOT NULL,
  PRIMARY KEY (research_project_id, publication_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id),
  FOREIGN KEY (publication_id) REFERENCES publications (id)
);
