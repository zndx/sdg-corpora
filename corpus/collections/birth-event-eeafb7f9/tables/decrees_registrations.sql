CREATE TABLE decrees_registrations (
  legislative_decree_id INTEGER NOT NULL,
  census_registration_id INTEGER NOT NULL,
  PRIMARY KEY (legislative_decree_id, census_registration_id),
  FOREIGN KEY (legislative_decree_id) REFERENCES legislative_decrees (id),
  FOREIGN KEY (census_registration_id) REFERENCES census_registrations (census_registration_id)
);
