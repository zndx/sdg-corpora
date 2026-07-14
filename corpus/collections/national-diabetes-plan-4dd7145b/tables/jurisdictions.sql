CREATE TABLE jurisdictions (
  id INTEGER NOT NULL,
  jurisdiction_id VARCHAR(34),
  jurisdiction_name VARCHAR(32),
  country_code VARCHAR(44),
  administrative_level VARCHAR(32),
  population_count INTEGER,
  area_code INTEGER,
  population_segment_id INTEGER,
  policy_id VARCHAR(35),
  health_service_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (population_segment_id) REFERENCES population_segments (id),
  FOREIGN KEY (policy_id) REFERENCES preventive_policies (policy_id),
  FOREIGN KEY (health_service_id) REFERENCES health_services (health_service_id)
);
