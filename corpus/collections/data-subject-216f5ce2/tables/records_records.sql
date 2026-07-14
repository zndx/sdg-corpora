CREATE TABLE records_records (
  consent_record_id INTEGER NOT NULL,
  data_processing_record_id INTEGER NOT NULL,
  PRIMARY KEY (consent_record_id, data_processing_record_id),
  FOREIGN KEY (consent_record_id) REFERENCES consent_records (id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id)
);
