CREATE TABLE healthcare_providers (
  id INTEGER NOT NULL,
  provider_id VARCHAR(35),
  provider_name VARCHAR(32),
  role VARCHAR(32),
  access_permission BOOLEAN,
  treatment_event_id INTEGER,
  disclosure_record_disclosure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (treatment_event_id) REFERENCES treatment_events (id),
  FOREIGN KEY (disclosure_record_disclosure_id) REFERENCES disclosure_records (disclosure_id)
);
