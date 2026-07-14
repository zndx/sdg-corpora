CREATE TABLE population_segments (
  id INTEGER NOT NULL,
  segment_id VARCHAR(44),
  segment_name VARCHAR(32),
  age_min INTEGER,
  age_max INTEGER,
  total_count INTEGER,
  diagnosed_count INTEGER,
  undiagnosed_count INTEGER,
  prevalence_rate DECIMAL,
  jurisdiction_id INTEGER,
  surveillance_metric_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (surveillance_metric_id) REFERENCES surveillance_metrics (id)
);
