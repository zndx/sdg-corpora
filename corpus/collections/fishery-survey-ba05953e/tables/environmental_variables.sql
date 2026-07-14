CREATE TABLE environmental_variables (
  environmental_variable_id INTEGER NOT NULL,
  variable_identifier VARCHAR(32),
  variable_name VARCHAR(32),
  measurement_unit VARCHAR(32),
  trend_direction VARCHAR(32),
  impact_severity VARCHAR(32),
  observation_period VARCHAR(32),
  coastal_zone_id INTEGER,
  fishery_survey_id INTEGER,
  fishermen_population_id INTEGER,
  PRIMARY KEY (environmental_variable_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id),
  FOREIGN KEY (fishery_survey_id) REFERENCES fishery_surveys (fishery_survey_id),
  FOREIGN KEY (fishermen_population_id) REFERENCES fishermen_populations (fishermen_population_id)
);
