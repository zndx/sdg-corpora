CREATE TABLE alpine_regions (
  id INTEGER NOT NULL,
  region_code VARCHAR(40),
  total_area_hectares DECIMAL,
  member_states VARCHAR(32),
  perimeter_definition_date DATE,
  PRIMARY KEY (id)
);
