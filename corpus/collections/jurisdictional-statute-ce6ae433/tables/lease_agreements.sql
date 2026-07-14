CREATE TABLE lease_agreements (
  lease_agreement_id INTEGER NOT NULL,
  lease_identifier VARCHAR(32),
  effective_date DATE,
  expiration_date DATE,
  royalty_percentage DECIMAL,
  bonus_payment_amount VARCHAR(32),
  lessor_name VARCHAR(32),
  lessee_name VARCHAR(32),
  land_parcel_id INTEGER,
  jurisdictional_statute_id INTEGER,
  PRIMARY KEY (lease_agreement_id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (land_parcel_id),
  FOREIGN KEY (jurisdictional_statute_id) REFERENCES jurisdictional_statutes (id)
);
