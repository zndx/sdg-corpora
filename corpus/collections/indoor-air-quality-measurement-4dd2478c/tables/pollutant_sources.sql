CREATE TABLE pollutant_sources (
  source_id VARCHAR(44) NOT NULL,
  source_name VARCHAR(32),
  source_category VARCHAR(32),
  emission_rate DECIMAL,
  installation_date DATE,
  maintenance_status VARCHAR(32),
  indoor_environment_id INTEGER,
  indoor_pollutant_id INTEGER,
  PRIMARY KEY (source_id),
  FOREIGN KEY (indoor_environment_id) REFERENCES indoor_environments (indoor_environment_id),
  FOREIGN KEY (indoor_pollutant_id) REFERENCES indoor_pollutants (id)
);
