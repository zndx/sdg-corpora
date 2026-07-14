CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  enrollment_status VARCHAR(32),
  guardian_contact_id VARCHAR(32),
  risk_profile VARCHAR(32),
  incident_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (incident_id) REFERENCES incidents (id)
);
