CREATE TABLE service_providers (
  service_provider_id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  incorporation_date DATE,
  shareholding_structure VARCHAR(32),
  compliance_status VARCHAR(32),
  account_number VARCHAR(32),
  PRIMARY KEY (service_provider_id),
  FOREIGN KEY (account_number) REFERENCES custodian_accounts (account_number)
);
