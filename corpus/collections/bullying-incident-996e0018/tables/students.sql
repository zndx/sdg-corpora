CREATE TABLE students (
  student_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  grade_level INTEGER,
  enrollment_status VARCHAR(32),
  date_of_birth DATE,
  guardian_contact_id VARCHAR(32),
  bullying_incident_id INTEGER,
  involved_in_incident_as_perpetrator_bullying_incident_id INTEGER,
  service_id VARCHAR(44),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (student_id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (involved_in_incident_as_perpetrator_bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id),
  FOREIGN KEY (service_id) REFERENCES support_services (service_id)
);
