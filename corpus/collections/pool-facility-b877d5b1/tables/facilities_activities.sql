CREATE TABLE facilities_activities (
  pool_facility_id INTEGER NOT NULL,
  maintenance_activity_id INTEGER NOT NULL,
  PRIMARY KEY (pool_facility_id, maintenance_activity_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id),
  FOREIGN KEY (maintenance_activity_id) REFERENCES maintenance_activities (maintenance_activity_id)
);
