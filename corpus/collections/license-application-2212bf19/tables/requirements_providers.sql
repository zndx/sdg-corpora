CREATE TABLE requirements_providers (
  requirement_id VARCHAR(38) NOT NULL,
  service_provider_id INTEGER NOT NULL,
  PRIMARY KEY (requirement_id, service_provider_id),
  FOREIGN KEY (requirement_id) REFERENCES compliance_requirements (requirement_id),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers (service_provider_id)
);
