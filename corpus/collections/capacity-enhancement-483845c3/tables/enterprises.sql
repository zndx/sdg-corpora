CREATE TABLE enterprises (
  id INTEGER NOT NULL,
  enterprise_name VARCHAR(32),
  ownership_type VARCHAR(32),
  registration_number VARCHAR(32),
  regulatory_authority VARCHAR(32),
  manufacturing_facility_id INTEGER,
  product_line_id INTEGER,
  enterprise_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (manufacturing_facility_id) REFERENCES manufacturing_facilities (id),
  FOREIGN KEY (product_line_id) REFERENCES product_lines (id),
  FOREIGN KEY (enterprise_id) REFERENCES enterprises (id)
);
