CREATE TABLE populations (
  population_id INTEGER NOT NULL,
  population_name VARCHAR(32),
  geographic_region VARCHAR(32),
  sample_size INTEGER,
  inclusion_criteria VARCHAR(32),
  monitoring_status VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (population_id)
);
