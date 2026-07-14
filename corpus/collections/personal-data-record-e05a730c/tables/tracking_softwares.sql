CREATE TABLE tracking_softwares (
  id INTEGER NOT NULL,
  software_id VARCHAR(32),
  software_name VARCHAR(32),
  provider_name VARCHAR(32),
  function_type VARCHAR(32),
  data_collected VARCHAR(32),
  digital_platform_id INTEGER,
  personal_data_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (personal_data_record_id) REFERENCES personal_data_records (id)
);
