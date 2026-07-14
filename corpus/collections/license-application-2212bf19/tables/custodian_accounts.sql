CREATE TABLE custodian_accounts (
  account_number VARCHAR(32) NOT NULL,
  minimum_capital_requirement DECIMAL,
  asset_liquidity_status BOOLEAN,
  bank_identifier VARCHAR(32),
  service_provider_id INTEGER,
  PRIMARY KEY (account_number),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers (service_provider_id)
);
