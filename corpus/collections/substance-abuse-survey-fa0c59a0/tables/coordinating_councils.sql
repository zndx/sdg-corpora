CREATE TABLE coordinating_councils (
  coordinating_council_id INTEGER NOT NULL,
  council_id VARCHAR(44),
  council_name VARCHAR(32),
  county_served VARCHAR(32),
  has_funding_available BOOLEAN,
  utilization_rate DECIMAL,
  established_date DATE,
  funding_source_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (coordinating_council_id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id)
);
