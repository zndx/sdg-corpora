CREATE TABLE quantum_key_distributions (
  quantum_key_distribution_id INTEGER NOT NULL,
  photon_polarization_states INTEGER,
  detector_type VARCHAR(32),
  eavesdropping_detection BOOLEAN,
  cyber_security_protocol_id INTEGER,
  receiver_device_i_d VARCHAR(32),
  PRIMARY KEY (quantum_key_distribution_id),
  FOREIGN KEY (cyber_security_protocol_id) REFERENCES cyber_security_protocols (cyber_security_protocol_id),
  FOREIGN KEY (receiver_device_i_d) REFERENCES receivers (device_i_d)
);
