CREATE TABLE housing_units (
  unit_id VARCHAR(44) NOT NULL,
  unit_type VARCHAR(32),
  bedrooms INTEGER,
  has_garden BOOLEAN,
  floor_level INTEGER,
  building_height INTEGER,
  development_project_id INTEGER,
  PRIMARY KEY (unit_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (development_project_id)
);
