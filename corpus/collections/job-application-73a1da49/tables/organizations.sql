CREATE TABLE organizations (
  organization_id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  telephone VARCHAR(32),
  fax VARCHAR(32),
  eopo_status BOOLEAN,
  PRIMARY KEY (organization_id)
);
