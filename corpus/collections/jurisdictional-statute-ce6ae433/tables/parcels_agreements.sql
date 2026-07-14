CREATE TABLE parcels_agreements (
  land_parcel_id INTEGER NOT NULL,
  lease_agreement_id INTEGER NOT NULL,
  PRIMARY KEY (land_parcel_id, lease_agreement_id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (land_parcel_id),
  FOREIGN KEY (lease_agreement_id) REFERENCES lease_agreements (lease_agreement_id)
);
