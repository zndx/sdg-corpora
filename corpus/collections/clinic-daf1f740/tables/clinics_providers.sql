CREATE TABLE clinics_providers (
  clinic_id INTEGER NOT NULL,
  provider_id INTEGER NOT NULL,
  PRIMARY KEY (clinic_id, provider_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id)
);
