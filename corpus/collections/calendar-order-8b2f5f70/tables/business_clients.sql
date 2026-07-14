CREATE TABLE business_clients (
  id INTEGER NOT NULL,
  business_name VARCHAR(32),
  contact_name VARCHAR(32),
  membership_status BOOLEAN,
  email_address VARCHAR(32),
  fax_number VARCHAR(32),
  website_url VARCHAR(55),
  PRIMARY KEY (id)
);
