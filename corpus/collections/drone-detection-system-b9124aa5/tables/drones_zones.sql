CREATE TABLE drones_zones (
  drone_id INTEGER NOT NULL,
  zone_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (drone_id, zone_id),
  FOREIGN KEY (drone_id) REFERENCES drones (id),
  FOREIGN KEY (zone_id) REFERENCES airspace_zones (zone_id)
);
