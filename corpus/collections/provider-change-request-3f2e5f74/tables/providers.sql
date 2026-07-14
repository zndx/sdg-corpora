CREATE TABLE providers (
  id INTEGER NOT NULL,
  provider_id VARCHAR(35),
  provider_name VARCHAR(32),
  provider_type VARCHAR(32),
  provider_change_request_id INTEGER,
  clinic_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (provider_change_request_id) REFERENCES provider_change_requests (provider_change_request_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);
