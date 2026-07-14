CREATE TABLE incidents_students (
  bullying_incident_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (bullying_incident_id, student_id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
