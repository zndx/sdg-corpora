CREATE TABLE billing_records (
  id INTEGER NOT NULL,
  billing_id VARCHAR(44),
  amount DECIMAL,
  payment_status VARCHAR(32),
  billing_date TIMESTAMP,
  treatment_event_id INTEGER,
  record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (treatment_event_id) REFERENCES treatment_events (id),
  FOREIGN KEY (record_id) REFERENCES patient_records (record_id)
);
