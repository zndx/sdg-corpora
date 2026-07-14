CREATE TABLE land_parcels (
  id INTEGER NOT NULL,
  parcel_id INTEGER,
  zoning_district VARCHAR(32),
  area_hectares DECIMAL,
  current_land_use VARCHAR(32),
  topography VARCHAR(32),
  municipality_id INTEGER,
  planning_application_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id),
  FOREIGN KEY (planning_application_id) REFERENCES planning_applications (id)
);
