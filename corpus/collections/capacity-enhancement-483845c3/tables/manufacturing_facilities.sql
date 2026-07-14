CREATE TABLE manufacturing_facilities (
  id INTEGER NOT NULL,
  facility_name VARCHAR(32),
  location VARCHAR(32),
  facility_type VARCHAR(32),
  operational_status VARCHAR(32),
  geographic_region_id INTEGER,
  product_line_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id),
  FOREIGN KEY (product_line_id) REFERENCES product_lines (id)
);
