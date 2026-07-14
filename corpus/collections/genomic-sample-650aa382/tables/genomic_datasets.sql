CREATE TABLE genomic_datasets (
  id INTEGER NOT NULL,
  dataset_id INTEGER,
  format VARCHAR(32),
  size_g_b DECIMAL,
  upload_date TIMESTAMP,
  access_level VARCHAR(32),
  sequencing_assay_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (sequencing_assay_id) REFERENCES sequencing_assays (sequencing_assay_id)
);
