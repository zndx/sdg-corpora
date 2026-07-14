CREATE TABLE genomic_samples (
  id INTEGER NOT NULL,
  sample_id INTEGER,
  collection_date TIMESTAMP,
  tissue_type VARCHAR(32),
  sequencing_coverage DECIMAL,
  quality_score DECIMAL,
  storage_location VARCHAR(32),
  sequencing_assay_id INTEGER,
  individual_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sequencing_assay_id) REFERENCES sequencing_assays (sequencing_assay_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
