CREATE TABLE projects_events (
  security_project_id INTEGER NOT NULL,
  world_caf_event_id INTEGER NOT NULL,
  PRIMARY KEY (security_project_id, world_caf_event_id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id)
);
