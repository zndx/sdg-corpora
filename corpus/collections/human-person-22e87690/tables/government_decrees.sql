CREATE TABLE government_decrees (
  id INTEGER NOT NULL,
  has_decree_title VARCHAR(32),
  has_issuing_emperor VARCHAR(32),
  has_enforcement_date DATE,
  has_legal_requirement VARCHAR(32),
  human_person_id INTEGER,
  census_registration_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (census_registration_id) REFERENCES census_registrations (id)
);
