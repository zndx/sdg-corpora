CREATE TABLE field_moderators (
  id INTEGER NOT NULL,
  moderator_identifier VARCHAR(32),
  full_name VARCHAR(36),
  expertise_area VARCHAR(32),
  role VARCHAR(32),
  session_count INTEGER,
  availability_status VARCHAR(32),
  security_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id)
);
