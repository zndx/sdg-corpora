CREATE TABLE flight_path_points (
  id INTEGER NOT NULL,
  point_id VARCHAR(44),
  latitude DECIMAL,
  longitude DECIMAL,
  altitude_meters DECIMAL,
  timestamp TIMESTAMP,
  data_package_id INTEGER,
  aero_scope_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_package_id) REFERENCES data_packages (id),
  FOREIGN KEY (aero_scope_system_id) REFERENCES aero_scope_systems (id)
);
