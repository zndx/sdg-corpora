CREATE TABLE extraction_wells (
  id INTEGER NOT NULL,
  well_identifier VARCHAR(32),
  completion_date TIMESTAMP,
  well_type VARCHAR(32),
  depth_meters DECIMAL,
  operator_name VARCHAR(32),
  status VARCHAR(32),
  land_parcel_id INTEGER,
  extraction_well_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (land_parcel_id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id)
);
