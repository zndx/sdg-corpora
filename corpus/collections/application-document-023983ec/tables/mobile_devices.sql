CREATE TABLE mobile_devices (
  id INTEGER NOT NULL,
  device_id INTEGER,
  manufacturer VARCHAR(46),
  model VARCHAR(32),
  os_version VARCHAR(32),
  camera_resolution DECIMAL,
  scanning_process_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (scanning_process_id) REFERENCES scanning_processes (id)
);
