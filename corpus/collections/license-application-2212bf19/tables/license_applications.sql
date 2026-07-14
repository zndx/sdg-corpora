CREATE TABLE license_applications (
  license_application_id INTEGER NOT NULL,
  application_id VARCHAR(32),
  submission_date TIMESTAMP,
  status VARCHAR(32),
  regulatory_reference VARCHAR(32),
  service_provider_id INTEGER,
  regulatory_authority_id INTEGER,
  fee_schedule_id INTEGER,
  PRIMARY KEY (license_application_id),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers (service_provider_id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id),
  FOREIGN KEY (fee_schedule_id) REFERENCES fee_schedules (id)
);
