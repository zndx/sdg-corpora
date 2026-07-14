CREATE TABLE patients (
  id INTEGER NOT NULL,
  patient_id VARCHAR(32),
  preferred_contact_method VARCHAR(32),
  preferred_contact_location VARCHAR(32),
  consent_status BOOLEAN,
  record_id INTEGER,
  treatment_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (record_id) REFERENCES patient_records (record_id),
  FOREIGN KEY (treatment_event_id) REFERENCES treatment_events (id)
);
