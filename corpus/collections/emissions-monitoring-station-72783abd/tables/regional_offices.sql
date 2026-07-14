CREATE TABLE regional_offices (
  id INTEGER NOT NULL,
  office_id INTEGER,
  office_name VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  established_date DATE,
  manager_id VARCHAR(44),
  test_crew_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (manager_id) REFERENCES project_managers (manager_id),
  FOREIGN KEY (test_crew_id) REFERENCES test_crews (test_crew_id)
);
