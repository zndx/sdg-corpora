CREATE TABLE indoor_pollutants (
  id INTEGER NOT NULL,
  pollutant_id VARCHAR(44),
  pollutant_name VARCHAR(32),
  source_type VARCHAR(32),
  toxicity_level VARCHAR(32),
  regulatory_limit DECIMAL,
  health_impact_category VARCHAR(32),
  source_id VARCHAR(44),
  vulnerable_population_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (source_id) REFERENCES pollutant_sources (source_id),
  FOREIGN KEY (vulnerable_population_id) REFERENCES vulnerable_populations (id)
);
