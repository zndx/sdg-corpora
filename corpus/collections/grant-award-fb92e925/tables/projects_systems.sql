CREATE TABLE projects_systems (
  sustainability_project_id INTEGER NOT NULL,
  water_harvesting_system_id INTEGER NOT NULL,
  PRIMARY KEY (sustainability_project_id, water_harvesting_system_id),
  FOREIGN KEY (sustainability_project_id) REFERENCES sustainability_projects (id),
  FOREIGN KEY (water_harvesting_system_id) REFERENCES water_harvesting_systems (water_harvesting_system_id)
);
