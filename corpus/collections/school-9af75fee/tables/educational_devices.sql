CREATE TABLE educational_devices (
  device_id INTEGER NOT NULL,
  device_type VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  procurement_cost VARCHAR(32),
  specification_score DECIMAL,
  status VARCHAR(32),
  school_id INTEGER,
  supplier_id INTEGER,
  PRIMARY KEY (device_id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);
