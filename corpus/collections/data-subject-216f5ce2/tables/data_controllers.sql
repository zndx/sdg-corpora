CREATE TABLE data_controllers (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  registration_number VARCHAR(32),
  registered_office VARCHAR(32),
  court_registry VARCHAR(32),
  website_url VARCHAR(55),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
