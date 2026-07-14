CREATE TABLE genomic_datasets (
  id INTEGER NOT NULL,
  dataset_id INTEGER,
  creation_date TIMESTAMP,
  size_in_g_b DECIMAL,
  format VARCHAR(32),
  checksum VARCHAR(32),
  access_level VARCHAR(32),
  sequencing_assay_id INTEGER,
  repository_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sequencing_assay_id) REFERENCES sequencing_assays (sequencing_assay_id),
  FOREIGN KEY (repository_id) REFERENCES data_repositories (repository_id)
);
