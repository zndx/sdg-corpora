CREATE TABLE power_splitter_combiners (
  id INTEGER NOT NULL,
  device_identifier VARCHAR(32),
  device_type VARCHAR(32),
  nominal_impedance DECIMAL,
  port_count INTEGER,
  isolation_rating DECIMAL,
  theoretical_insertion_loss DECIMAL,
  phase_relationship VARCHAR(32),
  status VARCHAR(32),
  signal_characteristic_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (signal_characteristic_id) REFERENCES signal_characteristics (id)
);
