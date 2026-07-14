CREATE TABLE adoption_petitioners (
  full_name VARCHAR(36),
  date_of_birth DATE,
  social_security_number VARCHAR(32) NOT NULL,
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  phone_number VARCHAR(32),
  email_address VARCHAR(32),
  date_moved_to_nevada DATE,
  relationship_to_adoptee VARCHAR(32),
  duration_of_acquaintance VARCHAR(32),
  adult_adoptee_id INTEGER,
  jurisdiction_id INTEGER,
  PRIMARY KEY (social_security_number),
  FOREIGN KEY (adult_adoptee_id) REFERENCES adult_adoptees (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (jurisdiction_id)
);
