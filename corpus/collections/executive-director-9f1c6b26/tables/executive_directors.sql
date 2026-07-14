CREATE TABLE executive_directors (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  reporting_to VARCHAR(32),
  position_type VARCHAR(32),
  salary_min DECIMAL,
  salary_max DECIMAL,
  degree_level VARCHAR(32),
  years_experience INTEGER,
  is_exempt BOOLEAN,
  organization_id INTEGER,
  facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id)
);
