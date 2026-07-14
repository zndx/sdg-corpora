CREATE TABLE fishery_surveys (
  fishery_survey_id INTEGER NOT NULL,
  survey_identifier VARCHAR(32),
  sampling_method VARCHAR(32),
  total_respondents INTEGER,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  coastal_zone_id INTEGER,
  fishermen_population_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (fishery_survey_id),
  FOREIGN KEY (coastal_zone_id) REFERENCES coastal_zones (id),
  FOREIGN KEY (fishermen_population_id) REFERENCES fishermen_populations (fishermen_population_id)
);
