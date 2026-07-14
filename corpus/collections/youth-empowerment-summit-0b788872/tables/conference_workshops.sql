CREATE TABLE conference_workshops (
  conference_workshop_id INTEGER NOT NULL,
  workshop_id INTEGER,
  workshop_title VARCHAR(32),
  topic VARCHAR(32),
  duration_minutes INTEGER,
  is_youth_only BOOLEAN,
  is_comprehensive BOOLEAN,
  youth_empowerment_summit_id INTEGER,
  staff_member_id INTEGER,
  PRIMARY KEY (conference_workshop_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id)
);
