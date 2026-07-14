CREATE TABLE facilities_members (
  pool_facility_id INTEGER NOT NULL,
  pool_staff_member_id INTEGER NOT NULL,
  PRIMARY KEY (pool_facility_id, pool_staff_member_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id)
);
