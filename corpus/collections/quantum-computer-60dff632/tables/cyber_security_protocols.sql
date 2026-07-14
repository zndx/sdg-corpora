CREATE TABLE cyber_security_protocols (
  cyber_security_protocol_id INTEGER NOT NULL,
  protocol_name VARCHAR(32),
  transmission_medium VARCHAR(32),
  max_distance DECIMAL,
  disruption_risk VARCHAR(32),
  quantum_key_distribution_id INTEGER,
  PRIMARY KEY (cyber_security_protocol_id),
  FOREIGN KEY (quantum_key_distribution_id) REFERENCES quantum_key_distributions (quantum_key_distribution_id)
);
