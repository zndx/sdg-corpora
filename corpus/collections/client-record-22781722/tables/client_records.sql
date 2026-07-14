CREATE TABLE client_records (
  client_identifier VARCHAR(32),
  full_name VARCHAR(36),
  date_of_birth DATE,
  home_address VARCHAR(32),
  phone_number VARCHAR(32) NOT NULL,
  email_address VARCHAR(32),
  health_history_summary VARCHAR(32),
  emergency_contact_name VARCHAR(32),
  emergency_contact_phone VARCHAR(32),
  client_record_phone_number VARCHAR(32),
  service_delivery_id INTEGER,
  consent_record_id INTEGER,
  PRIMARY KEY (phone_number),
  FOREIGN KEY (client_record_phone_number) REFERENCES client_records (phone_number),
  FOREIGN KEY (service_delivery_id) REFERENCES service_deliveries (id),
  FOREIGN KEY (consent_record_id) REFERENCES consent_records (id)
);
