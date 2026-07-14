CREATE TABLE health_services (
  health_service_id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  service_category VARCHAR(33),
  availability_status VARCHAR(32),
  target_group VARCHAR(32),
  geographic_coverage VARCHAR(32),
  cost_coverage_percent DECIMAL,
  jurisdiction_id INTEGER,
  population_segment_id INTEGER,
  PRIMARY KEY (health_service_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (population_segment_id) REFERENCES population_segments (id)
);
