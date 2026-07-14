CREATE TABLE methods_records (
  measurement_method_id INTEGER NOT NULL,
  record_id INTEGER NOT NULL,
  PRIMARY KEY (measurement_method_id, record_id),
  FOREIGN KEY (measurement_method_id) REFERENCES measurement_methods (measurement_method_id),
  FOREIGN KEY (record_id) REFERENCES condition_records (record_id)
);
