CREATE TABLE projects_moderators (
  security_project_id INTEGER NOT NULL,
  field_moderator_id INTEGER NOT NULL,
  PRIMARY KEY (security_project_id, field_moderator_id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id),
  FOREIGN KEY (field_moderator_id) REFERENCES field_moderators (id)
);
