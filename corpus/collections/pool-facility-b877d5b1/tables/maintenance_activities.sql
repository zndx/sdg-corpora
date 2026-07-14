CREATE TABLE maintenance_activities (
  maintenance_activity_id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_type VARCHAR(32),
  scheduled_date DATE,
  completed_date DATE,
  performed_by VARCHAR(32),
  health_standard_compliance BOOLEAN,
  notes VARCHAR(32),
  pool_facility_id INTEGER,
  pool_staff_member_id INTEGER,
  PRIMARY KEY (maintenance_activity_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id)
);
