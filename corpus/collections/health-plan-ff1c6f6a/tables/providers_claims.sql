CREATE TABLE providers_claims (
  healthcare_provider_id INTEGER NOT NULL,
  insurance_claim_id INTEGER NOT NULL,
  PRIMARY KEY (healthcare_provider_id, insurance_claim_id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id),
  FOREIGN KEY (insurance_claim_id) REFERENCES insurance_claims (id)
);
