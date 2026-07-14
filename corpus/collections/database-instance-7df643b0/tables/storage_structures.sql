CREATE TABLE storage_structures (
  id INTEGER NOT NULL,
  structure_id INTEGER,
  structure_type VARCHAR(32),
  size_g_b DECIMAL,
  storage_location VARCHAR(32),
  instance_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (instance_id) REFERENCES database_instances (instance_id)
);
