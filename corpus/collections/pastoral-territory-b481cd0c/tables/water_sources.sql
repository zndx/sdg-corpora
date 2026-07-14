CREATE TABLE water_sources (
  id INTEGER NOT NULL,
  source_identifier VARCHAR(32),
  source_name VARCHAR(32),
  source_type VARCHAR(32),
  depth_meters DECIMAL,
  flow_rate_liters_per_second DECIMAL,
  water_quality_index DECIMAL,
  discovery_date DATE,
  is_modern_invention BOOLEAN,
  pastoral_territory_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pastoral_territory_id) REFERENCES pastoral_territories (id)
);
