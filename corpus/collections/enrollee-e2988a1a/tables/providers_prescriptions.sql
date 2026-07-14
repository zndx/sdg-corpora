CREATE TABLE providers_prescriptions (
  provider_id INTEGER NOT NULL,
  prescription_id INTEGER NOT NULL,
  PRIMARY KEY (provider_id, prescription_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (id)
);
