CREATE TABLE business_units (
  business_unit_id INTEGER NOT NULL,
  unit_identifier VARCHAR(32),
  unit_name VARCHAR(32),
  sector VARCHAR(32),
  revenue DECIMAL,
  employee_count INTEGER,
  executive_role_id INTEGER,
  geographic_region_id INTEGER,
  PRIMARY KEY (business_unit_id),
  FOREIGN KEY (executive_role_id) REFERENCES executive_roles (executive_role_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id)
);
