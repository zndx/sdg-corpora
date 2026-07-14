CREATE TABLE projects_topics (
  security_project_id INTEGER NOT NULL,
  burglary_prevention_topic_id INTEGER NOT NULL,
  PRIMARY KEY (security_project_id, burglary_prevention_topic_id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id),
  FOREIGN KEY (burglary_prevention_topic_id) REFERENCES burglary_prevention_topics (id)
);
