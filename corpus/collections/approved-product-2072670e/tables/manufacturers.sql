CREATE TABLE manufacturers (
  id INTEGER NOT NULL,
  manufacturer_name VARCHAR(54),
  legal_form VARCHAR(32),
  registered_address VARCHAR(32),
  country_of_origin VARCHAR(32),
  registration_number VARCHAR(32),
  approving_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (approving_authority_id) REFERENCES approving_authorities (approving_authority_id)
);
