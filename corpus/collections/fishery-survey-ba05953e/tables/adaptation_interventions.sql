CREATE TABLE adaptation_interventions (
  adaptation_intervention_id INTEGER NOT NULL,
  intervention_identifier VARCHAR(32),
  intervention_type VARCHAR(32),
  target_audience VARCHAR(32),
  implementation_date DATE,
  status VARCHAR(32),
  budget_allocated DECIMAL,
  fishermen_population_id INTEGER,
  coastal_zone_id INTEGER,
  PRIMARY KEY (adaptation_intervention_id),
  FOREIGN KEY (fishermen_population_id) REFERENCES fishermen_populations (fishermen_population_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id)
);
