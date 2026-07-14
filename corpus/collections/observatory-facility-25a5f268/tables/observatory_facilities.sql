CREATE TABLE observatory_facilities (
  id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  location VARCHAR(32),
  land_area_acres DECIMAL,
  land_ownership_type VARCHAR(32),
  operational_status VARCHAR(32),
  established_date DATE,
  managing_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (managing_organization_id) REFERENCES managing_organizations (id)
);
