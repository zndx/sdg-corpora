CREATE TABLE clinical_trials (
  id INTEGER NOT NULL,
  trial_id VARCHAR(44),
  phase VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  primary_outcome VARCHAR(32),
  genomic_dataset_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
