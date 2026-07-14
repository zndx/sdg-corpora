CREATE TABLE network_services (
  service_id VARCHAR(44) NOT NULL,
  service_name VARCHAR(32),
  protocol_type VARCHAR(32),
  requires_credential BOOLEAN,
  last_credential_update TIMESTAMP,
  network_configuration_id INTEGER,
  password_credential_id INTEGER,
  PRIMARY KEY (service_id),
  FOREIGN KEY (network_configuration_id) REFERENCES network_configurations (id),
  FOREIGN KEY (password_credential_id) REFERENCES password_credentials (password_credential_id)
);
