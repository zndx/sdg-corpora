CREATE TABLE programs_crews (
  emissions_test_program_id INTEGER NOT NULL,
  test_crew_id INTEGER NOT NULL,
  PRIMARY KEY (emissions_test_program_id, test_crew_id),
  FOREIGN KEY (emissions_test_program_id) REFERENCES emissions_test_programs (id),
  FOREIGN KEY (test_crew_id) REFERENCES test_crews (test_crew_id)
);
