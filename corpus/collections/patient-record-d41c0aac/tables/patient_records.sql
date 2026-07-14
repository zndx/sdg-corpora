CREATE TABLE patient_records (
  record_id INTEGER NOT NULL,
  patient_name VARCHAR(32),
  date_of_service TIMESTAMP,
  record_status VARCHAR(32),
  access_level VARCHAR(32),
  patient_id INTEGER,
  billing_record_id INTEGER,
  treatment_event_id INTEGER,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (billing_record_id) REFERENCES billing_records (id),
  FOREIGN KEY (treatment_event_id) REFERENCES treatment_events (id)
);
