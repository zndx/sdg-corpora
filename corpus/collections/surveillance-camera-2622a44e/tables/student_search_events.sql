CREATE TABLE student_search_events (
  student_search_event_id INTEGER NOT NULL,
  search_id VARCHAR(44),
  timestamp TIMESTAMP,
  initiated_by VARCHAR(32),
  reasonableness_inception BOOLEAN,
  reasonableness_scope BOOLEAN,
  intrusiveness_level VARCHAR(32),
  outcome VARCHAR(32),
  student_id INTEGER,
  school_zone_id INTEGER,
  school_policy_id INTEGER,
  PRIMARY KEY (student_search_event_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (school_zone_id) REFERENCES school_zones (school_zone_id),
  FOREIGN KEY (school_policy_id) REFERENCES school_policies (id)
);
