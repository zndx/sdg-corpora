CREATE TABLE protected_areas (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  area_size DECIMAL,
  establishment_date DATE,
  management_status VARCHAR(32),
  zoning_classification VARCHAR(32),
  country_code VARCHAR(32),
  management_unit_id INTEGER,
  project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (management_unit_id) REFERENCES management_units (id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id)
);
