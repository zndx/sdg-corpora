CREATE TABLE charities (
  charity_id INTEGER NOT NULL,
  charity_name VARCHAR(32),
  target_beneficiaries VARCHAR(32),
  location VARCHAR(32),
  is_local BOOLEAN,
  campus_event_id INTEGER,
  student_organization_id INTEGER,
  PRIMARY KEY (charity_id),
  FOREIGN KEY (campus_event_id) REFERENCES campus_events (campus_event_id),
  FOREIGN KEY (student_organization_id) REFERENCES student_organizations (id)
);
