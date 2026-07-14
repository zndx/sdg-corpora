CREATE TABLE service_charges (
  service_charge_id INTEGER NOT NULL,
  charge_percentage DECIMAL,
  charge_amount VARCHAR(32),
  distribution_method VARCHAR(32),
  is_mandatory BOOLEAN,
  calculation_date TIMESTAMP,
  dining_package_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (service_charge_id),
  FOREIGN KEY (dining_package_id) REFERENCES dining_packages (dining_package_id)
);
