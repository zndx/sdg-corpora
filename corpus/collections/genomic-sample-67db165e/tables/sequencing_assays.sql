CREATE TABLE sequencing_assays (
  sequencing_assay_id INTEGER NOT NULL,
  assay_id INTEGER,
  assay_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  coverage_depth DECIMAL,
  platform VARCHAR(32),
  genomic_dataset_id INTEGER,
  genomic_sample_id INTEGER,
  PRIMARY KEY (sequencing_assay_id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id),
  FOREIGN KEY (genomic_sample_id) REFERENCES genomic_samples (id)
);
