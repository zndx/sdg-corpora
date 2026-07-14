CREATE TABLE channels_records (
  communication_channel_id INTEGER NOT NULL,
  data_processing_record_id INTEGER NOT NULL,
  PRIMARY KEY (communication_channel_id, data_processing_record_id),
  FOREIGN KEY (communication_channel_id) REFERENCES communication_channels (id),
  FOREIGN KEY (data_processing_record_id) REFERENCES data_processing_records (data_processing_record_id)
);
