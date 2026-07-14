CREATE TABLE zones_systems (
  zone_id VARCHAR(44) NOT NULL,
  drone_detection_system_id INTEGER NOT NULL,
  PRIMARY KEY (zone_id, drone_detection_system_id),
  FOREIGN KEY (zone_id) REFERENCES airspace_zones (zone_id),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id)
);
