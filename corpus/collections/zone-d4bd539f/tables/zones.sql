CREATE TABLE zones (
  id INTEGER NOT NULL,
  zone_identifier VARCHAR(32),
  zone_length DECIMAL,
  zone_width DECIMAL,
  zone_elevation VARCHAR(32),
  zone_status VARCHAR(32),
  checkpoint_id INTEGER,
  has_exit_point_checkpoint_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (checkpoint_id) REFERENCES checkpoints (checkpoint_id),
  FOREIGN KEY (has_exit_point_checkpoint_id) REFERENCES checkpoints (checkpoint_id)
);
