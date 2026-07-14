CREATE TABLE infrastructures (
  infra_id INTEGER NOT NULL,
  infra_type VARCHAR(32),
  capacity INTEGER,
  current_utilization DECIMAL,
  condition VARCHAR(32),
  municipality_id INTEGER,
  land_parcel_id INTEGER,
  PRIMARY KEY (infra_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (id)
);
