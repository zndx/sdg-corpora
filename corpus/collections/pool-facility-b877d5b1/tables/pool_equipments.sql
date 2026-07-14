CREATE TABLE pool_equipments (
  pool_equipment_id INTEGER NOT NULL,
  equipment_id VARCHAR(34),
  equipment_name VARCHAR(32),
  equipment_type VARCHAR(32),
  installation_date DATE,
  last_maintenance_date DATE,
  operational_status VARCHAR(32),
  weight_kg DECIMAL,
  pool_facility_id INTEGER,
  pool_staff_member_id INTEGER,
  PRIMARY KEY (pool_equipment_id),
  FOREIGN KEY (pool_facility_id) REFERENCES pool_facilities (pool_facility_id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id)
);
