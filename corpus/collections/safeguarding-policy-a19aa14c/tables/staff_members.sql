CREATE TABLE staff_members (
  staff_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  employment_status VARCHAR(32),
  role VARCHAR(32),
  last_training_date DATE,
  background_check_status VARCHAR(32),
  staff_member_staff_id INTEGER,
  incident_id INTEGER,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id),
  FOREIGN KEY (incident_id) REFERENCES incidents (id)
);
