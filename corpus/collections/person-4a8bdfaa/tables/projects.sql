CREATE TABLE projects (
  project_id VARCHAR(44) NOT NULL,
  project_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  strategic_objective_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (project_id),
  FOREIGN KEY (strategic_objective_id) REFERENCES strategic_objectives (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
