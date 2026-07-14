CREATE TABLE transport_services (
  service_id VARCHAR(44) NOT NULL,
  pickup_time TIMESTAMP,
  dropoff_time TIMESTAMP,
  service_status VARCHAR(32),
  authorization_id VARCHAR(32),
  minor_passenger_id INTEGER,
  location_id INTEGER,
  terminates_at_location_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (service_id),
  FOREIGN KEY (authorization_id) REFERENCES transport_authorizations (authorization_id),
  FOREIGN KEY (minor_passenger_id) REFERENCES minor_passengers (id),
  FOREIGN KEY (location_id) REFERENCES locations (id),
  FOREIGN KEY (terminates_at_location_id) REFERENCES locations (id)
);
