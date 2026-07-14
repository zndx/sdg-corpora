CREATE TABLE meetings_officers (
  safety_meeting_id INTEGER NOT NULL,
  animal_control_officer_id INTEGER NOT NULL,
  PRIMARY KEY (safety_meeting_id, animal_control_officer_id),
  FOREIGN KEY (safety_meeting_id) REFERENCES safety_meetings (safety_meeting_id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id)
);
