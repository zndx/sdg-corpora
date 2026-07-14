CREATE TABLE residential_addresses (
  residential_address_id INTEGER NOT NULL,
  street_address VARCHAR(32),
  city VARCHAR(32),
  state_code INTEGER,
  zip_code VARCHAR(44),
  adoption_petitioner_id INTEGER,
  adult_to_be_adopted_social_security_number VARCHAR(32),
  PRIMARY KEY (residential_address_id),
  FOREIGN KEY (adoption_petitioner_id) REFERENCES adoption_petitioners (id),
  FOREIGN KEY (adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number)
);
