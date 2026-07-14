CREATE TABLE emergency_contacts (
  emergency_contact_id INTEGER NOT NULL,
  contact_name VARCHAR(32),
  contact_phone VARCHAR(32),
  authorization_id VARCHAR(32),
  PRIMARY KEY (emergency_contact_id),
  FOREIGN KEY (authorization_id) REFERENCES transport_authorizations (authorization_id)
);
