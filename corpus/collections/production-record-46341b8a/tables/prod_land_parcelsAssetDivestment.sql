CREATE TABLE prod_land_parcelsAssetDivestment (
  land_parcel_id INTEGER NOT NULL,
  divestment_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (land_parcel_id, divestment_id),
  FOREIGN KEY (land_parcel_id) REFERENCES prod_land_parcels (land_parcel_id),
  FOREIGN KEY (divestment_id) REFERENCES prod_asset_divestments (divestment_id)
);
