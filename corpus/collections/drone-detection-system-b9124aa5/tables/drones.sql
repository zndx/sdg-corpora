CREATE TABLE drones (
  id INTEGER NOT NULL,
  drone_id INTEGER,
  manufacturer VARCHAR(46),
  model VARCHAR(32),
  serial_number INTEGER,
  operational_status VARCHAR(32),
  PRIMARY KEY (id)
);
