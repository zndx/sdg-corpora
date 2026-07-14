CREATE TABLE parcels_wells (
  land_parcel_id INTEGER NOT NULL,
  extraction_well_id INTEGER NOT NULL,
  PRIMARY KEY (land_parcel_id, extraction_well_id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (land_parcel_id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id)
);
