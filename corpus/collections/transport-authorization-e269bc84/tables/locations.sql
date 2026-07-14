CREATE TABLE locations (
  id INTEGER NOT NULL,
  address_line VARCHAR(32),
  location_type VARCHAR(32),
  supervision_required BOOLEAN,
  authorization_id VARCHAR(32),
  is_dropoff_for_authorization_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (authorization_id) REFERENCES transport_authorizations (authorization_id),
  FOREIGN KEY (is_dropoff_for_authorization_id) REFERENCES transport_authorizations (authorization_id)
);
