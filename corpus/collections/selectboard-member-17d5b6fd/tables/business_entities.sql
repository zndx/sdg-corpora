CREATE TABLE business_entities (
  business_id VARCHAR(40) NOT NULL,
  legal_name VARCHAR(32),
  dba_name VARCHAR(32),
  business_type VARCHAR(33),
  industry_sector VARCHAR(32),
  license_id VARCHAR(35),
  parcel_id INTEGER,
  municipal_fund_id INTEGER,
  PRIMARY KEY (business_id),
  FOREIGN KEY (license_id) REFERENCES licenses (license_id),
  FOREIGN KEY (parcel_id) REFERENCES parcels (id),
  FOREIGN KEY (municipal_fund_id) REFERENCES municipal_funds (municipal_fund_id)
);
