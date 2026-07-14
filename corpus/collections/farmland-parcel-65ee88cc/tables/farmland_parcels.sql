CREATE TABLE farmland_parcels (
  farmland_parcel_id INTEGER NOT NULL,
  parcel_id INTEGER,
  acreage DECIMAL,
  zoning_district VARCHAR(32),
  soil_quality_index DECIMAL,
  purchase_date TIMESTAMP,
  current_market_value DECIMAL,
  institutional_investor_id INTEGER,
  geographic_region_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (farmland_parcel_id),
  FOREIGN KEY (institutional_investor_id) REFERENCES institutional_investors (institutional_investor_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
