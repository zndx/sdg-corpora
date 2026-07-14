CREATE TABLE facilities (
  id INTEGER NOT NULL,
  building_count INTEGER,
  age_min INTEGER,
  age_max INTEGER,
  safety_status VARCHAR(32),
  last_inspection_date DATE,
  maintenance_schedule VARCHAR(32),
  is_historic BOOLEAN,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
