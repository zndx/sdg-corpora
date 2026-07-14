CREATE TABLE surveillance_metrics (
  id INTEGER NOT NULL,
  metric_id VARCHAR(44),
  metric_type VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  measurement_date DATE,
  population_age_range VARCHAR(32),
  data_source VARCHAR(32),
  population_segment_id INTEGER,
  surveillance_framework_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (population_segment_id) REFERENCES population_segments (id),
  FOREIGN KEY (surveillance_framework_id) REFERENCES surveillance_frameworks (id)
);
