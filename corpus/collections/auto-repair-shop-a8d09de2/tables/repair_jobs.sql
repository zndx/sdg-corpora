CREATE TABLE repair_jobs (
  id INTEGER NOT NULL,
  job_id VARCHAR(37),
  job_type VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  labor_cost DECIMAL,
  parts_cost DECIMAL,
  status VARCHAR(32),
  technician_id INTEGER,
  vehicle_id INTEGER,
  invoice_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (technician_id) REFERENCES technicians (technician_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (invoice_id)
);
