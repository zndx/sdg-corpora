CREATE TABLE students (
  student_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  enrollment_status VARCHAR(32),
  start_date DATE,
  residency_percentage DECIMAL,
  financial_obligations_met BOOLEAN,
  ggpa DECIMAL,
  credential_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (credential_id) REFERENCES credentials (credential_id)
);
