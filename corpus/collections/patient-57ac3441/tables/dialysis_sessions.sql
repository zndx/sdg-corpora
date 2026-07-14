CREATE TABLE dialysis_sessions (
  session_id VARCHAR(44) NOT NULL,
  start_date TIMESTAMP,
  duration DECIMAL,
  status VARCHAR(32),
  patient_id INTEGER,
  facility_id INTEGER,
  PRIMARY KEY (session_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id)
);
