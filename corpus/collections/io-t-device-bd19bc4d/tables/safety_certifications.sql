CREATE TABLE safety_certifications (
  id INTEGER NOT NULL,
  certification_id VARCHAR(44),
  standard_code VARCHAR(32),
  issuing_authority VARCHAR(32),
  issue_date DATE,
  expiry_date DATE,
  status VARCHAR(32),
  scope_description VARCHAR(32),
  io_t_device_id INTEGER,
  manufacturer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (io_t_device_id) REFERENCES io_t_devices (id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);
