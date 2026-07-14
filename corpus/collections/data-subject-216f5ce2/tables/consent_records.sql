CREATE TABLE consent_records (
  id INTEGER NOT NULL,
  consent_timestamp TIMESTAMP,
  consent_status VARCHAR(32),
  consent_scope VARCHAR(32),
  withdrawal_timestamp TIMESTAMP,
  data_subject_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id)
);
