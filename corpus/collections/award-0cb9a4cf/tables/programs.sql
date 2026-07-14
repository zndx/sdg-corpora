CREATE TABLE programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  program_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  budget DECIMAL,
  campus_id INTEGER,
  person_id INTEGER,
  policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_id) REFERENCES campuses (campus_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (policy_id) REFERENCES policies (id)
);
