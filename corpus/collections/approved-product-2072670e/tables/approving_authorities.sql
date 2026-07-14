CREATE TABLE approving_authorities (
  approving_authority_id INTEGER NOT NULL,
  authority_name VARCHAR(32),
  authority_type VARCHAR(32),
  jurisdiction VARCHAR(32),
  contact_address VARCHAR(32),
  authorization_level VARCHAR(32),
  PRIMARY KEY (approving_authority_id)
);
