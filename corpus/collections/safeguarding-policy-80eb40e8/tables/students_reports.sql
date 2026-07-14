CREATE TABLE students_reports (
  student_id INTEGER NOT NULL,
  incident_report_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, incident_report_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
