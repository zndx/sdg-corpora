CREATE TABLE individuals_samples (
  individual_id INTEGER NOT NULL,
  genomic_sample_id INTEGER NOT NULL,
  PRIMARY KEY (individual_id, genomic_sample_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id),
  FOREIGN KEY (genomic_sample_id) REFERENCES genomic_samples (id)
);
