CREATE TABLE third_party_services (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  service_type VARCHAR(32),
  contract_start_date DATE,
  contract_end_date DATE,
  security_level VARCHAR(32),
  PRIMARY KEY (id)
);
