CREATE TABLE consent_records (
  id INTEGER NOT NULL,
  consent_id VARCHAR(44),
  consent_date TIMESTAMP,
  consent_status VARCHAR(32),
  scope_of_consent VARCHAR(32),
  client_record_phone_number VARCHAR(32),
  service_delivery_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (client_record_phone_number) REFERENCES client_records (phone_number),
  FOREIGN KEY (service_delivery_id) REFERENCES service_deliveries (id)
);
