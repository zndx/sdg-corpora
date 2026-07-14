CREATE TABLE countries (
  country_code VARCHAR(44) NOT NULL,
  country_name VARCHAR(32),
  region VARCHAR(32),
  forest_plantation_id INTEGER,
  industrial_facility_id INTEGER,
  PRIMARY KEY (country_code),
  FOREIGN KEY (forest_plantation_id) REFERENCES forest_plantations (id),
  FOREIGN KEY (industrial_facility_id) REFERENCES industrial_facilities (id)
);
