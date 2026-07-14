CREATE TABLE records_channels (
  data_processing_record_id INTEGER NOT NULL,
  communication_channel_id INTEGER NOT NULL,
  PRIMARY KEY (data_processing_record_id, communication_channel_id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id),
  FOREIGN KEY (communication_channel_id) REFERENCES communication_channels (id)
);
