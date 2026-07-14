CREATE TABLE property_parcels (
  id INTEGER NOT NULL,
  street_address VARCHAR(32),
  municipality VARCHAR(32),
  parcel_id INTEGER,
  zoning_district VARCHAR(32),
  land_use_category VARCHAR(32),
  permit_id VARCHAR(44),
  inspection_event_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (id)
);
