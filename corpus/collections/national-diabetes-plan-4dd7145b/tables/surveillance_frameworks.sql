CREATE TABLE surveillance_frameworks (
  id INTEGER NOT NULL,
  framework_id VARCHAR(44),
  framework_name VARCHAR(32),
  adoption_status VARCHAR(32),
  frequency VARCHAR(32),
  scope VARCHAR(32),
  last_review_date DATE,
  surveillance_metric_id INTEGER,
  jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_metric_id) REFERENCES surveillance_metrics (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);
