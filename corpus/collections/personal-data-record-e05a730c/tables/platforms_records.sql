CREATE TABLE platforms_records (
  digital_platform_id INTEGER NOT NULL,
  personal_data_record_id INTEGER NOT NULL,
  PRIMARY KEY (digital_platform_id, personal_data_record_id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (personal_data_record_id) REFERENCES personal_data_records (id)
);
