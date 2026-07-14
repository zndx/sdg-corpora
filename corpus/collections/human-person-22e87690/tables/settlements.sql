CREATE TABLE settlements (
  settlement_id INTEGER NOT NULL,
  has_settlement_name VARCHAR(32),
  has_geographic_region VARCHAR(32),
  has_population_density INTEGER,
  building_id INTEGER,
  census_registration_id INTEGER,
  PRIMARY KEY (settlement_id),
  FOREIGN KEY (building_id) REFERENCES buildings (id),
  FOREIGN KEY (census_registration_id) REFERENCES census_registrations (id)
);
