CREATE TABLE cancer_types (
  id INTEGER NOT NULL,
  cancer_name VARCHAR(32),
  anatomical_region VARCHAR(32),
  is_primary BOOLEAN,
  clinical_code INTEGER,
  cancer_waiting_time_target_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cancer_waiting_time_target_id) REFERENCES cancer_waiting_time_targets (id)
);
