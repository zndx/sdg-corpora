CREATE TABLE providers_applications (
  service_provider_id INTEGER NOT NULL,
  license_application_id INTEGER NOT NULL,
  PRIMARY KEY (service_provider_id, license_application_id),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers (service_provider_id),
  FOREIGN KEY (license_application_id) REFERENCES license_applications (license_application_id)
);
