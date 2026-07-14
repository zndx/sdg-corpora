CREATE TABLE data_processing_records (
  data_processing_record_id INTEGER NOT NULL,
  processing_purpose VARCHAR(32),
  legal_ground VARCHAR(32),
  data_extent VARCHAR(32),
  processing_period_start TIMESTAMP,
  processing_period_end TIMESTAMP,
  is_objection_allowed BOOLEAN,
  data_controller_id INTEGER,
  PRIMARY KEY (data_processing_record_id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id)
);
