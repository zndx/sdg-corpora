CREATE TABLE clients (
  client_id INTEGER NOT NULL,
  mh_number VARCHAR(32),
  full_name VARCHAR(36),
  is_minor BOOLEAN,
  primary_contact_phone VARCHAR(34),
  assigned_clinic VARCHAR(32),
  provider_change_request_id INTEGER,
  clinic_id INTEGER,
  PRIMARY KEY (client_id),
  FOREIGN KEY (provider_change_request_id) REFERENCES provider_change_requests (provider_change_request_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);
