CREATE TABLE geopolitical_regions (
  id INTEGER NOT NULL,
  region_identifier VARCHAR(32),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  current_influence_level VARCHAR(32),
  historical_status VARCHAR(32),
  strategic_operation_id INTEGER,
  religious_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (strategic_operation_id) REFERENCES strategic_operations (id),
  FOREIGN KEY (religious_organization_id) REFERENCES religious_organizations (religious_organization_id)
);
