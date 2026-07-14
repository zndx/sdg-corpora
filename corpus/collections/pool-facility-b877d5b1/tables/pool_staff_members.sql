CREATE TABLE pool_staff_members (
  id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  position_title VARCHAR(32),
  employment_status VARCHAR(32),
  hire_date DATE,
  termination_date DATE,
  supervisor_id VARCHAR(35),
  certifications VARCHAR(32),
  pool_staff_member_id INTEGER,
  pool_facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id)
);
