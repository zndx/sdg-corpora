CREATE TABLE projects_communities (
  development_project_id INTEGER NOT NULL,
  affected_community_id INTEGER NOT NULL,
  PRIMARY KEY (development_project_id, affected_community_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (id),
  FOREIGN KEY (affected_community_id) REFERENCES affected_communities (affected_community_id)
);
