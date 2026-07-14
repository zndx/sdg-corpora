CREATE TABLE video_management_softwares (
  id INTEGER NOT NULL,
  software_id VARCHAR(32),
  version VARCHAR(32),
  license_type VARCHAR(32),
  max_cameras INTEGER,
  supports_h_d BOOLEAN,
  supports_i_p BOOLEAN,
  supports_analog BOOLEAN,
  surveillance_installation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_installation_id) REFERENCES surveillance_installations (surveillance_installation_id)
);
