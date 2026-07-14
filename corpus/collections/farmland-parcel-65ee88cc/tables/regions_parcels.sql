CREATE TABLE regions_parcels (
  geographic_region_id INTEGER NOT NULL,
  farmland_parcel_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, farmland_parcel_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (farmland_parcel_id) REFERENCES farmland_parcels (farmland_parcel_id)
);
