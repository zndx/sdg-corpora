CREATE TABLE student_organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  is_philanthropic BOOLEAN,
  founding_year INTEGER,
  campus_event_id INTEGER,
  academic_department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_event_id) REFERENCES campus_events (campus_event_id),
  FOREIGN KEY (academic_department_id) REFERENCES academic_departments (academic_department_id)
);
