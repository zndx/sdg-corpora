CREATE TABLE individuals_claims (
  eligible_individual_id INTEGER NOT NULL,
  insurance_claim_id INTEGER NOT NULL,
  PRIMARY KEY (eligible_individual_id, insurance_claim_id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (id),
  FOREIGN KEY (insurance_claim_id) REFERENCES insurance_claims (id)
);
