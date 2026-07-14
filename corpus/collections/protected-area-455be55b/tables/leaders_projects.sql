CREATE TABLE leaders_projects (
  project_leader_id INTEGER NOT NULL,
  project_code VARCHAR(44) NOT NULL,
  PRIMARY KEY (project_leader_id, project_code),
  FOREIGN KEY (project_leader_id) REFERENCES project_leaders (id),
  FOREIGN KEY (project_code) REFERENCES joint_european_projects (project_code)
);
