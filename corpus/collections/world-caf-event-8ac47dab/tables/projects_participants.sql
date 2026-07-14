CREATE TABLE projects_participants (
  security_project_id INTEGER NOT NULL,
  field_participant_id INTEGER NOT NULL,
  PRIMARY KEY (security_project_id, field_participant_id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id)
);
