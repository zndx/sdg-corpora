CREATE TABLE investigators (
  investigator_id INTEGER NOT NULL,
  person_id VARCHAR(32),
  role VARCHAR(32),
  assigned_campus VARCHAR(32),
  authorization_date TIMESTAMP,
  current_case_load INTEGER,
  investigation_id INTEGER,
  PRIMARY KEY (investigator_id),
  FOREIGN KEY (investigation_id) REFERENCES investigations (id)
);
