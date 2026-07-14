CREATE TABLE school_zones (
  school_zone_id INTEGER NOT NULL,
  zone_id VARCHAR(44),
  zone_type VARCHAR(32),
  privacy_level VARCHAR(32),
  is_indoor BOOLEAN,
  capacity INTEGER,
  surveillance_camera_id INTEGER,
  student_search_event_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (school_zone_id),
  FOREIGN KEY (surveillance_camera_id) REFERENCES surveillance_cameras (id),
  FOREIGN KEY (student_search_event_id) REFERENCES student_search_events (student_search_event_id)
);
