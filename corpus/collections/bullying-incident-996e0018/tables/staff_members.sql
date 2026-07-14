CREATE TABLE staff_members (
  id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  employment_status VARCHAR(32),
  department VARCHAR(32),
  cybersafety_trained BOOLEAN,
  bullying_incident_id INTEGER,
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
