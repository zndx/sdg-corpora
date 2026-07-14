CREATE TABLE personal_datas (
  id INTEGER NOT NULL,
  data_category VARCHAR(32),
  consent_status VARCHAR(32),
  collection_purpose VARCHAR(32),
  retention_period VARCHAR(32),
  is_sensitive BOOLEAN,
  data_controller_id INTEGER,
  data_subject_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id)
);
