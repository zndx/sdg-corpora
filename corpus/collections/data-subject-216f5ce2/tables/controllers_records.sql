CREATE TABLE controllers_records (
  data_controller_id INTEGER NOT NULL,
  data_processing_record_id INTEGER NOT NULL,
  PRIMARY KEY (data_controller_id, data_processing_record_id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id)
);
