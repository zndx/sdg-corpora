CREATE TABLE health_records (
  record_id INTEGER NOT NULL,
  compilation_date TIMESTAMP,
  risk_score DECIMAL,
  diagnosis_codes VARCHAR(32),
  medication_list VARCHAR(32),
  last_review_date TIMESTAMP,
  individual_id INTEGER,
  genomic_dataset_id INTEGER,
  PRIMARY KEY (record_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
