CREATE TABLE vulnerable_populations (
  id INTEGER NOT NULL,
  population_group_id VARCHAR(44),
  group_type VARCHAR(32),
  prevalence_rate DECIMAL,
  risk_factor VARCHAR(32),
  health_outcome VARCHAR(32),
  indoor_pollutant_id INTEGER,
  indoor_environment_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (indoor_pollutant_id) REFERENCES indoor_pollutants (id),
  FOREIGN KEY (indoor_environment_id) REFERENCES indoor_environments (indoor_environment_id)
);
