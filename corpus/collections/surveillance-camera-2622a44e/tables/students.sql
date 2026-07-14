CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  age INTEGER,
  sex VARCHAR(32),
  grade_level INTEGER,
  enrollment_status VARCHAR(32),
  student_search_event_id INTEGER,
  school_zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_search_event_id) REFERENCES student_search_events (student_search_event_id),
  FOREIGN KEY (school_zone_id) REFERENCES school_zones (school_zone_id)
);
