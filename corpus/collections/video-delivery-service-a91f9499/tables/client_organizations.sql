CREATE TABLE client_organizations (
  client_id VARCHAR(32) NOT NULL,
  organization_name VARCHAR(32),
  industry_sector VARCHAR(32),
  region VARCHAR(32),
  account_manager VARCHAR(32),
  PRIMARY KEY (client_id)
);
