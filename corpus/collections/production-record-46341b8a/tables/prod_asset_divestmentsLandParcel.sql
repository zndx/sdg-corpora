CREATE TABLE prod_asset_divestmentsLandParcel (
  divestment_id VARCHAR(32) NOT NULL,
  land_parcel_id INTEGER NOT NULL,
  PRIMARY KEY (divestment_id, land_parcel_id),
  FOREIGN KEY (divestment_id) REFERENCES prod_asset_divestments (divestment_id),
  FOREIGN KEY (land_parcel_id) REFERENCES prod_land_parcels (land_parcel_id)
);
