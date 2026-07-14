CREATE TABLE school_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  title VARCHAR(32),
  effective_date DATE,
  last_reviewed DATE,
  approval_status VARCHAR(32),
  jurisdiction VARCHAR(32),
  student_search_event_id INTEGER,
  surveillance_camera_id INTEGER,
  school_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_search_event_id) REFERENCES student_search_events (student_search_event_id),
  FOREIGN KEY (surveillance_camera_id) REFERENCES surveillance_cameras (id),
  FOREIGN KEY (school_policy_id) REFERENCES school_policies (id)
);
