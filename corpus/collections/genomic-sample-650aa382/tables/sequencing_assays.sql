CREATE TABLE sequencing_assays (
  sequencing_assay_id INTEGER NOT NULL,
  assay_id INTEGER,
  assay_type VARCHAR(32),
  coverage_depth INTEGER,
  platform VARCHAR(32),
  result_status VARCHAR(32),
  genomic_sample_id INTEGER,
  genomic_dataset_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (sequencing_assay_id),
  FOREIGN KEY (genomic_sample_id) REFERENCES genomic_samples (id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
