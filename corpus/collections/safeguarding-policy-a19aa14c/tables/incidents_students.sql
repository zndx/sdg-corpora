CREATE TABLE incidents_students (
  incident_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (incident_id, student_id),
  FOREIGN KEY (incident_id) REFERENCES incidents (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
