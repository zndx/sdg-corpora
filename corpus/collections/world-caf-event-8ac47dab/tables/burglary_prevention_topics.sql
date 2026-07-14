CREATE TABLE burglary_prevention_topics (
  id INTEGER NOT NULL,
  topic_identifier VARCHAR(32),
  topic_name VARCHAR(32),
  category VARCHAR(32),
  complexity_level VARCHAR(32),
  is_primary_focus BOOLEAN,
  security_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id)
);
