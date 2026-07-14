CREATE TABLE production_batches (
  production_batch_id INTEGER NOT NULL,
  batch_id VARCHAR(44),
  production_date TIMESTAMP,
  production_facility_id VARCHAR(35),
  total_volume DECIMAL,
  feedstock_type VARCHAR(32),
  batch_status VARCHAR(32),
  biodiesel_grade_id INTEGER,
  tank_id VARCHAR(32),
  PRIMARY KEY (production_batch_id),
  FOREIGN KEY (biodiesel_grade_id) REFERENCES biodiesel_grades (id),
  FOREIGN KEY (tank_id) REFERENCES storage_tanks (tank_id)
);
