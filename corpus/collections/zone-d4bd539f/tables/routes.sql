CREATE TABLE routes (
  id INTEGER NOT NULL,
  route_id VARCHAR(44),
  route_status VARCHAR(32),
  total_length DECIMAL,
  generation_time TIMESTAMP,
  steering_compliant BOOLEAN,
  zone_id INTEGER,
  checkpoint_id INTEGER,
  ends_at_checkpoint_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (checkpoint_id) REFERENCES checkpoints (checkpoint_id),
  FOREIGN KEY (ends_at_checkpoint_id) REFERENCES checkpoints (checkpoint_id)
);
