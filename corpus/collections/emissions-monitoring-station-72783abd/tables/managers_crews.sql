CREATE TABLE managers_crews (
  manager_id VARCHAR(44) NOT NULL,
  test_crew_id INTEGER NOT NULL,
  PRIMARY KEY (manager_id, test_crew_id),
  FOREIGN KEY (manager_id) REFERENCES project_managers (manager_id),
  FOREIGN KEY (test_crew_id) REFERENCES test_crews (test_crew_id)
);
