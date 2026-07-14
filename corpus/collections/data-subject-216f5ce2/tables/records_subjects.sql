CREATE TABLE records_subjects (
  data_processing_record_id INTEGER NOT NULL,
  data_subject_id INTEGER NOT NULL,
  PRIMARY KEY (data_processing_record_id, data_subject_id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id)
);
