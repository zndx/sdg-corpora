CREATE TABLE service_deliveries (
  id INTEGER NOT NULL,
  service_type VARCHAR(32),
  delivery_date TIMESTAMP,
  service_status VARCHAR(32),
  provider_staff_id VARCHAR(32),
  interaction_notes VARCHAR(32),
  client_record_phone_number VARCHAR(32),
  staff_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (client_record_phone_number) REFERENCES client_records (phone_number),
  FOREIGN KEY (staff_record_id) REFERENCES staff_records (id)
);
