CREATE TABLE datas_records (
  earth_observation_data_id INTEGER NOT NULL,
  record_id INTEGER NOT NULL,
  PRIMARY KEY (earth_observation_data_id, record_id),
  FOREIGN KEY (earth_observation_data_id) REFERENCES earth_observation_datas (id),
  FOREIGN KEY (record_id) REFERENCES condition_records (record_id)
);
