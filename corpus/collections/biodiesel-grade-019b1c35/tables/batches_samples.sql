CREATE TABLE batches_samples (
  production_batch_id INTEGER NOT NULL,
  fuel_sample_id INTEGER NOT NULL,
  PRIMARY KEY (production_batch_id, fuel_sample_id),
  FOREIGN KEY (production_batch_id) REFERENCES production_batches (production_batch_id),
  FOREIGN KEY (fuel_sample_id) REFERENCES fuel_samples (id)
);
