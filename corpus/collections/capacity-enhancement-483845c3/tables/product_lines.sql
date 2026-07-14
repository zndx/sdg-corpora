CREATE TABLE product_lines (
  id INTEGER NOT NULL,
  product_category VARCHAR(32),
  technology_readiness_level INTEGER,
  target_output_m_w DECIMAL,
  is_strategic BOOLEAN,
  enterprise_id INTEGER,
  manufacturing_facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enterprise_id) REFERENCES enterprises (id),
  FOREIGN KEY (manufacturing_facility_id) REFERENCES manufacturing_facilities (id)
);
