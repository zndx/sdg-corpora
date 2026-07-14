CREATE TABLE census_registrations (
  census_registration_id INTEGER NOT NULL,
  registration_date DATE,
  mandated_by VARCHAR(32),
  purpose VARCHAR(32),
  registrant_name VARCHAR(32),
  legislative_decree_id INTEGER,
  human_id INTEGER,
  location_id INTEGER,
  PRIMARY KEY (census_registration_id),
  FOREIGN KEY (legislative_decree_id) REFERENCES legislative_decrees (id),
  FOREIGN KEY (human_id) REFERENCES humans (id),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);
