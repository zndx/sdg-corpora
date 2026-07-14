CREATE TABLE secu_library_properties (
  library_property_id INTEGER NOT NULL,
  property_id INTEGER,
  address VARCHAR(32),
  property_type VARCHAR(32),
  square_footage DECIMAL,
  last_inspection_date DATE,
  security_camera_id INTEGER,
  incident_id VARCHAR(32),
  PRIMARY KEY (library_property_id),
  FOREIGN KEY (security_camera_id) REFERENCES secu_security_cameras (security_camera_id),
  FOREIGN KEY (incident_id) REFERENCES secu_security_incidents (incident_id)
);
