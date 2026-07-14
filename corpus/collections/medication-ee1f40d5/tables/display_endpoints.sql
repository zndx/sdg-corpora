CREATE TABLE display_endpoints (
  id INTEGER NOT NULL,
  endpoint_id VARCHAR(44),
  device_type VARCHAR(32),
  ip_address VARCHAR(32),
  status VARCHAR(32),
  location_room VARCHAR(32),
  last_heartbeat TIMESTAMP,
  medication_fact_sheet_id INTEGER,
  patient_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (medication_fact_sheet_id) REFERENCES medication_fact_sheets (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
