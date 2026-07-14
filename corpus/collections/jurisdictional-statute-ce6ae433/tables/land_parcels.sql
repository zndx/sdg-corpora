CREATE TABLE land_parcels (
  land_parcel_id INTEGER NOT NULL,
  parcel_identifier VARCHAR(32),
  county_name VARCHAR(32),
  state_name VARCHAR(32),
  total_area_acres DECIMAL,
  zoning_classification VARCHAR(32),
  surface_owner_name VARCHAR(32),
  jurisdictional_statute_id INTEGER,
  PRIMARY KEY (land_parcel_id),
  FOREIGN KEY (jurisdictional_statute_id) REFERENCES jurisdictional_statutes (id)
);
