CREATE TABLE prod_land_parcels (
  land_parcel_id INTEGER NOT NULL,
  parcel_id INTEGER,
  acreage DECIMAL,
  location VARCHAR(32),
  development_status VARCHAR(32),
  area_name VARCHAR(32),
  PRIMARY KEY (land_parcel_id)
);
