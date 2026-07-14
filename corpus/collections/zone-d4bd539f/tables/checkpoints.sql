CREATE TABLE checkpoints (
  checkpoint_id INTEGER NOT NULL,
  checkpoint_type VARCHAR(32),
  checkpoint_x DECIMAL,
  checkpoint_y DECIMAL,
  checkpoint_status VARCHAR(32),
  zone_id INTEGER,
  route_id INTEGER,
  serves_as_end_for_route_id INTEGER,
  PRIMARY KEY (checkpoint_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (route_id) REFERENCES routes (id),
  FOREIGN KEY (serves_as_end_for_route_id) REFERENCES routes (id)
);
