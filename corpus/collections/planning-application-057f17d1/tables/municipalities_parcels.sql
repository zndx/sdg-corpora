CREATE TABLE municipalities_parcels (
  municipality_id INTEGER NOT NULL,
  land_parcel_id INTEGER NOT NULL,
  PRIMARY KEY (municipality_id, land_parcel_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (id)
);
