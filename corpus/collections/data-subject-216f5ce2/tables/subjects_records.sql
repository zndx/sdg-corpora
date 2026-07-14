CREATE TABLE subjects_records (
  data_subject_id INTEGER NOT NULL,
  data_processing_record_id INTEGER NOT NULL,
  PRIMARY KEY (data_subject_id, data_processing_record_id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id)
);
