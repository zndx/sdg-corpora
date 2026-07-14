CREATE TABLE production_reports (
  report_id VARCHAR(32) NOT NULL,
  report_date DATE,
  organization_name VARCHAR(32),
  region_name VARCHAR(32),
  volume_bpd DECIMAL,
  unit_of_measure VARCHAR(32),
  data_source VARCHAR(32),
  geographic_region_id INTEGER,
  corporate_entity_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (report_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (id)
);
