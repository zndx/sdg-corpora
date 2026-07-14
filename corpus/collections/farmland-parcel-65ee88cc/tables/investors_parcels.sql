CREATE TABLE investors_parcels (
  institutional_investor_id INTEGER NOT NULL,
  farmland_parcel_id INTEGER NOT NULL,
  PRIMARY KEY (institutional_investor_id, farmland_parcel_id),
  FOREIGN KEY (institutional_investor_id) REFERENCES institutional_investors (institutional_investor_id),
  FOREIGN KEY (farmland_parcel_id) REFERENCES farmland_parcels (farmland_parcel_id)
);
