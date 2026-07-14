CREATE TABLE geographic_regions (
  geographic_region_id INTEGER NOT NULL,
  region_code VARCHAR(40),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  region_status VARCHAR(32),
  corporate_entity_id INTEGER,
  PRIMARY KEY (geographic_region_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (corporate_entity_id)
);
