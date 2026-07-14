CREATE TABLE receivers (
  device_i_d VARCHAR(32) NOT NULL,
  location VARCHAR(32),
  detector_sensitivity DECIMAL,
  quantum_key_distribution_id INTEGER,
  PRIMARY KEY (device_i_d),
  FOREIGN KEY (quantum_key_distribution_id) REFERENCES quantum_key_distributions (quantum_key_distribution_id)
);
