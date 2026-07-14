CREATE TABLE incidents (
  id INTEGER NOT NULL,
  incident_id VARCHAR(32),
  reported_date TIMESTAMP,
  incident_date TIMESTAMP,
  location VARCHAR(32),
  severity_rating INTEGER,
  status VARCHAR(32),
  risk_level VARCHAR(32),
  staff_member_staff_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
