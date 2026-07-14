CREATE TABLE zones_drones (
  zone_id VARCHAR(44) NOT NULL,
  drone_id INTEGER NOT NULL,
  PRIMARY KEY (zone_id, drone_id),
  FOREIGN KEY (zone_id) REFERENCES airspace_zones (zone_id),
  FOREIGN KEY (drone_id) REFERENCES drones (id)
);
