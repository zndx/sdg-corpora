CREATE TABLE building_permits (
  permit_id VARCHAR(44) NOT NULL,
  issue_date DATE,
  expiry_date DATE,
  project_type_code VARCHAR(32),
  project_type_description VARCHAR(32),
  ownership_type VARCHAR(32),
  total_units INTEGER,
  contracted_square_feet DECIMAL,
  status VARCHAR(32),
  property_parcel_id INTEGER,
  building_inspections_division_id INTEGER,
  PRIMARY KEY (permit_id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (building_inspections_division_id) REFERENCES building_inspections_divisions (id)
);
