CREATE TABLE fishermen_populations (
  fishermen_population_id INTEGER NOT NULL,
  population_identifier VARCHAR(32),
  registered_count INTEGER,
  primary_gear_type VARCHAR(32),
  average_vessel_size DECIMAL,
  adaptation_readiness VARCHAR(32),
  coastal_zone_id INTEGER,
  fishery_survey_id INTEGER,
  PRIMARY KEY (fishermen_population_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id),
  FOREIGN KEY (fishery_survey_id) REFERENCES fishery_surveys (fishery_survey_id)
);
