CREATE TABLE secu_video_surveillance_datas (
  id INTEGER NOT NULL,
  data_id VARCHAR(32),
  capture_date_time TIMESTAMP,
  duration_seconds INTEGER,
  data_format VARCHAR(32),
  storage_status VARCHAR(32),
  access_level VARCHAR(32),
  security_camera_id INTEGER,
  incident_id VARCHAR(32),
  data_storage_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (security_camera_id) REFERENCES secu_security_cameras (security_camera_id),
  FOREIGN KEY (incident_id) REFERENCES secu_security_incidents (incident_id),
  FOREIGN KEY (data_storage_system_id) REFERENCES secu_data_storage_systems (id)
);
