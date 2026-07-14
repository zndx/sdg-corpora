CREATE TABLE reports_students (
  incident_report_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (incident_report_id, student_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
