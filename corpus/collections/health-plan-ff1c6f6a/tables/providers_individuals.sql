CREATE TABLE providers_individuals (
  healthcare_provider_id INTEGER NOT NULL,
  eligible_individual_id INTEGER NOT NULL,
  PRIMARY KEY (healthcare_provider_id, eligible_individual_id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (id)
);
