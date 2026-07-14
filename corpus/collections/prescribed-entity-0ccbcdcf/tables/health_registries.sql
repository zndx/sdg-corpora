CREATE TABLE health_registries (
  health_registry_id INTEGER NOT NULL,
  registry_id VARCHAR(44),
  registry_name VARCHAR(32),
  data_category VARCHAR(32),
  last_updated TIMESTAMP,
  record_count INTEGER,
  prescribed_entity_id INTEGER,
  patient_record_id INTEGER,
  PRIMARY KEY (health_registry_id),
  FOREIGN KEY (prescribed_entity_id) REFERENCES prescribed_entities (prescribed_entity_id),
  FOREIGN KEY (patient_record_id) REFERENCES patient_records (id)
);
