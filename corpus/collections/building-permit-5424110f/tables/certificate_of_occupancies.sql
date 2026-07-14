CREATE TABLE certificate_of_occupancies (
  certificate_of_occupancy_id INTEGER NOT NULL,
  c_of_o_id VARCHAR(38),
  issue_date DATE,
  reason VARCHAR(32),
  building_square_footage DECIMAL,
  occupancy_status VARCHAR(32),
  property_parcel_id INTEGER,
  permit_id VARCHAR(44),
  building_inspections_division_id INTEGER,
  PRIMARY KEY (certificate_of_occupancy_id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (building_inspections_division_id) REFERENCES building_inspections_divisions (id)
);
