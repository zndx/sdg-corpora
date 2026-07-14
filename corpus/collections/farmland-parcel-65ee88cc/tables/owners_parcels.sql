CREATE TABLE owners_parcels (
  owner_id VARCHAR(32) NOT NULL,
  farmland_parcel_id INTEGER NOT NULL,
  PRIMARY KEY (owner_id, farmland_parcel_id),
  FOREIGN KEY (owner_id) REFERENCES land_owners (owner_id),
  FOREIGN KEY (farmland_parcel_id) REFERENCES farmland_parcels (farmland_parcel_id)
);
