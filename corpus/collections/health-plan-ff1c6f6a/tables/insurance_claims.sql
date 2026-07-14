CREATE TABLE insurance_claims (
  id INTEGER NOT NULL,
  claim_identifier VARCHAR(32),
  claim_date DATE,
  claim_amount VARCHAR(32),
  claim_status VARCHAR(32),
  covers_over_the_counter BOOLEAN,
  requires_pre_authorization BOOLEAN,
  eligible_individual_id INTEGER,
  health_plan_id INTEGER,
  healthcare_provider_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id)
);
