CREATE TABLE humans (
  id INTEGER NOT NULL,
  given_name VARCHAR(32),
  family_name VARCHAR(32),
  role VARCHAR(32),
  ancestral_town VARCHAR(32),
  occupation VARCHAR(32),
  location_id INTEGER,
  census_registration_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (location_id) REFERENCES locations (id),
  FOREIGN KEY (census_registration_id) REFERENCES census_registrations (census_registration_id)
);
