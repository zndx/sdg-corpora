CREATE TABLE clinics (
  id INTEGER NOT NULL,
  clinic_code VARCHAR(40),
  clinic_name VARCHAR(32),
  location_code INTEGER,
  manager_id INTEGER,
  provider_id INTEGER,
  client_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (manager_id) REFERENCES managers (id),
  FOREIGN KEY (provider_id) REFERENCES providers (id),
  FOREIGN KEY (client_id) REFERENCES clients (client_id)
);
