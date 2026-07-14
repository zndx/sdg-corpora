CREATE TABLE systems_zones (
  drone_detection_system_id INTEGER NOT NULL,
  zone_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (drone_detection_system_id, zone_id),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id),
  FOREIGN KEY (zone_id) REFERENCES airspace_zones (zone_id)
);
