CREATE TABLE campus_events (
  campus_event_id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  event_location VARCHAR(32),
  is_annual BOOLEAN,
  charity_beneficiary VARCHAR(32),
  campus_area_id INTEGER,
  student_organization_id INTEGER,
  charity_id INTEGER,
  PRIMARY KEY (campus_event_id),
  FOREIGN KEY (campus_area_id) REFERENCES campus_areas (id),
  FOREIGN KEY (student_organization_id) REFERENCES student_organizations (id),
  FOREIGN KEY (charity_id) REFERENCES charities (charity_id)
);
