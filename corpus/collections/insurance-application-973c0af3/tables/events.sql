CREATE TABLE events (
  event_id INTEGER NOT NULL,
  event_name VARCHAR(32),
  location_name VARCHAR(32),
  estimated_date DATE,
  expected_attendance INTEGER,
  is_minor_participant_event BOOLEAN,
  coverage_requested VARCHAR(32),
  organization_id INTEGER,
  coverage_policy_id INTEGER,
  PRIMARY KEY (event_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (coverage_policy_id) REFERENCES coverage_policies (id)
);
