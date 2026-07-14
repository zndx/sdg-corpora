CREATE TABLE eligible_individuals (
  id INTEGER NOT NULL,
  individual_identifier VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  relationship_to_employee VARCHAR(32),
  is_adult_dependent BOOLEAN,
  coverage_status VARCHAR(32),
  health_plan_id INTEGER,
  healthcare_provider_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id)
);
