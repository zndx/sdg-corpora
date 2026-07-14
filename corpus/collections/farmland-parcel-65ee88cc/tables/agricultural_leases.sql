CREATE TABLE agricultural_leases (
  id INTEGER NOT NULL,
  lease_id INTEGER,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  annual_rent DECIMAL,
  lease_status VARCHAR(32),
  crop_type VARCHAR(32),
  farmland_parcel_id INTEGER,
  institutional_investor_id INTEGER,
  owner_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (farmland_parcel_id) REFERENCES farmland_parcels (farmland_parcel_id),
  FOREIGN KEY (institutional_investor_id) REFERENCES institutional_investors (institutional_investor_id),
  FOREIGN KEY (owner_id) REFERENCES land_owners (owner_id)
);
