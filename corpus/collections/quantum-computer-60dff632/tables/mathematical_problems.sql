CREATE TABLE mathematical_problems (
  mathematical_problem_id INTEGER NOT NULL,
  problem_name VARCHAR(32),
  classical_complexity VARCHAR(32),
  quantum_complexity VARCHAR(32),
  quantum_computer_id INTEGER,
  PRIMARY KEY (mathematical_problem_id),
  FOREIGN KEY (quantum_computer_id) REFERENCES quantum_computers (id)
);
