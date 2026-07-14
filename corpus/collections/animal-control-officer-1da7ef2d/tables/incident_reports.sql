CREATE TABLE incident_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_date TIMESTAMP,
  report_type VARCHAR(32),
  injured_party VARCHAR(32),
  description VARCHAR(32),
  review_status VARCHAR(32),
  animal_emergency_id INTEGER,
  animal_control_officer_id INTEGER,
  safety_meeting_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (animal_emergency_id) REFERENCES animal_emergencies (id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id),
  FOREIGN KEY (safety_meeting_id) REFERENCES safety_meetings (safety_meeting_id)
);
