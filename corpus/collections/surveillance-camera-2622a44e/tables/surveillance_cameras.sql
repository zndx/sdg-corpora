CREATE TABLE surveillance_cameras (
  id INTEGER NOT NULL,
  camera_id VARCHAR(44),
  location VARCHAR(32),
  installation_date DATE,
  is_active BOOLEAN,
  coverage_area VARCHAR(32),
  resolution VARCHAR(32),
  school_zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (school_zone_id) REFERENCES school_zones (school_zone_id)
);
