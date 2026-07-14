CREATE TABLE field_participants (
  id INTEGER NOT NULL,
  participant_identifier VARCHAR(32),
  full_name VARCHAR(36),
  organization VARCHAR(39),
  role VARCHAR(32),
  motivation_level VARCHAR(32),
  previous_experience BOOLEAN,
  security_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id)
);
