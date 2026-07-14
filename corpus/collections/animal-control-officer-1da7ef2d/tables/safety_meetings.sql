CREATE TABLE safety_meetings (
  safety_meeting_id INTEGER NOT NULL,
  meeting_id VARCHAR(44),
  meeting_date TIMESTAMP,
  facilitator VARCHAR(32),
  attendance_count INTEGER,
  notes_status VARCHAR(32),
  concerns_raised INTEGER,
  animal_control_officer_id INTEGER,
  PRIMARY KEY (safety_meeting_id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id)
);
