CREATE TABLE safety_directors (
  director_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  role_type VARCHAR(32),
  appointment_date DATE,
  is_sponsor BOOLEAN,
  facility_id VARCHAR(35),
  sub_group_id INTEGER,
  forum_meeting_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (director_id),
  FOREIGN KEY (facility_id) REFERENCES nuclear_facilities (facility_id),
  FOREIGN KEY (sub_group_id) REFERENCES sub_groups (id),
  FOREIGN KEY (forum_meeting_id) REFERENCES forum_meetings (id)
);
