CREATE TABLE healthcare_providers (
  id INTEGER NOT NULL,
  provider_identifier VARCHAR(32),
  provider_name VARCHAR(32),
  specialty VARCHAR(32),
  license_number VARCHAR(32),
  accepts_new_patients BOOLEAN,
  PRIMARY KEY (id)
);
