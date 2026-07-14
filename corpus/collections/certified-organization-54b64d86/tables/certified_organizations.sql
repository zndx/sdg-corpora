CREATE TABLE certified_organizations (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  registered_address VARCHAR(32),
  certification_body VARCHAR(32),
  certification_body_region VARCHAR(32),
  certification_body_representative VARCHAR(32),
  certification_body_title VARCHAR(32),
  PRIMARY KEY (id)
);
