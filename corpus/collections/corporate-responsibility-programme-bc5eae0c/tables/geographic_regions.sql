CREATE TABLE geographic_regions (
  id INTEGER NOT NULL,
  region_code VARCHAR(40),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  population INTEGER,
  primary_language VARCHAR(32),
  business_unit_id INTEGER,
  c_s_r_component_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (business_unit_id),
  FOREIGN KEY (c_s_r_component_id) REFERENCES c_s_r_components (id)
);
