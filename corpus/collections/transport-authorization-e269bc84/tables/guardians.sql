CREATE TABLE guardians (
  id INTEGER NOT NULL,
  guardian_name VARCHAR(32),
  contact_phone VARCHAR(32),
  home_phone VARCHAR(32),
  signature_date TIMESTAMP,
  authorization_id VARCHAR(32),
  minor_passenger_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authorization_id) REFERENCES transport_authorizations (authorization_id),
  FOREIGN KEY (minor_passenger_id) REFERENCES minor_passengers (id)
);
