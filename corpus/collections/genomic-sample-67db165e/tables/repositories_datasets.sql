CREATE TABLE repositories_datasets (
  repository_id INTEGER NOT NULL,
  genomic_dataset_id INTEGER NOT NULL,
  PRIMARY KEY (repository_id, genomic_dataset_id),
  FOREIGN KEY (repository_id) REFERENCES data_repositories (repository_id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
