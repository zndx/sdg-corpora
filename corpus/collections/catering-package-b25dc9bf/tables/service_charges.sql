CREATE TABLE service_charges (
  id INTEGER NOT NULL,
  charge_id INTEGER,
  charge_type VARCHAR(32),
  charge_value DECIMAL,
  charge_name VARCHAR(32),
  applies_to_group_size VARCHAR(32),
  catering_package_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (id)
);
