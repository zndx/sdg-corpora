CREATE TABLE storage_tanks (
  tank_id VARCHAR(32) NOT NULL,
  tank_capacity DECIMAL,
  current_fill_level DECIMAL,
  tank_material VARCHAR(32),
  last_inspection_date DATE,
  tank_status VARCHAR(32),
  production_batch_id INTEGER,
  fuel_sample_id INTEGER,
  PRIMARY KEY (tank_id),
  FOREIGN KEY (production_batch_id) REFERENCES production_batches (production_batch_id),
  FOREIGN KEY (fuel_sample_id) REFERENCES fuel_samples (id)
);
