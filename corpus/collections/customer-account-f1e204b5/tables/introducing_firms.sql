CREATE TABLE introducing_firms (
  firm_identifier VARCHAR(32),
  firm_name VARCHAR(32),
  registration_number VARCHAR(32) NOT NULL,
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  PRIMARY KEY (registration_number)
);
