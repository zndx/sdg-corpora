CREATE TABLE data_acquisition_units (
  id INTEGER NOT NULL,
  acquisition_unit_id VARCHAR(32),
  firmware_version VARCHAR(32),
  sampling_rate DECIMAL,
  data_format VARCHAR(32),
  status VARCHAR(32),
  last_sync_timestamp TIMESTAMP,
  radar_station_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (radar_station_id) REFERENCES radar_stations (radar_station_id)
);
