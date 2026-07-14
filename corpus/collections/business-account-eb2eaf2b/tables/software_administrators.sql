CREATE TABLE software_administrators (
  id INTEGER NOT NULL,
  administrator_id VARCHAR(44),
  role_status VARCHAR(32),
  authorization_level VARCHAR(32),
  business_account_vat_number VARCHAR(32),
  method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (business_account_vat_number) REFERENCES business_accounts (vat_number),
  FOREIGN KEY (method_id) REFERENCES work_methods (method_id)
);
