CREATE TABLE health_records (
  health_record_id INTEGER NOT NULL,
  record_id INTEGER,
  last_updated TIMESTAMP,
  completeness_score DECIMAL,
  record_type VARCHAR(32),
  privacy_level VARCHAR(32),
  individual_id INTEGER,
  genomic_dataset_id INTEGER,
  PRIMARY KEY (health_record_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
