CREATE TABLE pool_facilities (
  pool_facility_id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  municipality VARCHAR(32),
  state VARCHAR(32),
  is_outdoor BOOLEAN,
  operating_season VARCHAR(32),
  last_inspection_date DATE,
  health_department_compliance_status VARCHAR(32),
  PRIMARY KEY (pool_facility_id)
);
