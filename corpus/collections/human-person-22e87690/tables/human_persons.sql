CREATE TABLE human_persons (
  id INTEGER NOT NULL,
  has_given_name VARCHAR(34),
  has_family_name VARCHAR(32),
  has_occupation_role VARCHAR(32),
  has_residence_location VARCHAR(32),
  has_ancestral_origin_location VARCHAR(32),
  human_person_id INTEGER,
  has_spouse_human_person_id INTEGER,
  settlement_id INTEGER,
  census_registration_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (has_spouse_human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (settlement_id) REFERENCES settlements (settlement_id),
  FOREIGN KEY (census_registration_id) REFERENCES census_registrations (id)
);
