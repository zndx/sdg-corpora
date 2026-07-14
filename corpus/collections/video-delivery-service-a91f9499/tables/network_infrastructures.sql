CREATE TABLE network_infrastructures (
  network_id VARCHAR(44) NOT NULL,
  protocol VARCHAR(32),
  bandwidth DECIMAL,
  latency DECIMAL,
  operating_system VARCHAR(32),
  status VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (network_id)
);
