CREATE TABLE staff_records (
  id INTEGER NOT NULL,
  staff_identifier VARCHAR(32),
  full_name VARCHAR(36),
  home_address VARCHAR(32),
  date_of_birth DATE,
  social_insurance_number VARCHAR(32),
  bank_account_number VARCHAR(32),
  employment_status VARCHAR(32),
  performance_rating DECIMAL,
  service_delivery_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_delivery_id) REFERENCES service_deliveries (id)
);
