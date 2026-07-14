CREATE TABLE athena_platforms (
  id INTEGER NOT NULL,
  platform_id VARCHAR(44),
  region VARCHAR(32),
  capacity_tbps DECIMAL,
  is_operational BOOLEAN,
  last_maintenance DATE,
  scrubbing_center_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (scrubbing_center_id) REFERENCES scrubbing_centers (id)
);
