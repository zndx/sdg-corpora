CREATE TABLE minor_passengers (
  id INTEGER NOT NULL,
  passenger_name VARCHAR(32),
  age INTEGER,
  minimum_age INTEGER,
  is_unaccompanied BOOLEAN,
  authorization_id VARCHAR(32),
  guardian_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authorization_id) REFERENCES transport_authorizations (authorization_id),
  FOREIGN KEY (guardian_id) REFERENCES guardians (id)
);
