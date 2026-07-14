CREATE TABLE prod_geographic_regionsProductionRecord (
  geographic_region_id INTEGER NOT NULL,
  production_record_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, production_record_id),
  FOREIGN KEY (geographic_region_id) REFERENCES prod_geographic_regions (id),
  FOREIGN KEY (production_record_id) REFERENCES prod_production_records (id)
);
