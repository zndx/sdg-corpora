CREATE TABLE video_management_systems (
  system_identifier VARCHAR(32),
  version_number VARCHAR(32) NOT NULL,
  deployment_mode VARCHAR(32),
  is_scalable BOOLEAN,
  last_maintenance_date DATE,
  manufacturer_id VARCHAR(34),
  center_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (version_number),
  FOREIGN KEY (center_id) REFERENCES control_centers (center_id)
);
