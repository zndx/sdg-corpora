CREATE TABLE vehicles (
  id INTEGER NOT NULL,
  vin VARCHAR(32),
  make VARCHAR(32),
  model VARCHAR(32),
  year INTEGER,
  mileage INTEGER,
  customer_name VARCHAR(32),
  customer_id INTEGER,
  repair_job_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (repair_job_id) REFERENCES repair_jobs (id)
);
