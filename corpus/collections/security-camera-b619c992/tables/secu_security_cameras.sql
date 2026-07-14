CREATE TABLE secu_security_cameras (
  security_camera_id INTEGER NOT NULL,
  camera_id VARCHAR(44),
  location VARCHAR(32),
  installation_date TIMESTAMP,
  is_audio_enabled BOOLEAN,
  status VARCHAR(32),
  library_property_id INTEGER,
  video_surveillance_data_id INTEGER,
  PRIMARY KEY (security_camera_id),
  FOREIGN KEY (library_property_id) REFERENCES secu_library_properties (library_property_id),
  FOREIGN KEY (video_surveillance_data_id) REFERENCES secu_video_surveillance_datas (id)
);
