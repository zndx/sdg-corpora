CREATE TABLE business_accounts (
  business_identifier VARCHAR(32),
  vat_number VARCHAR(32) NOT NULL,
  registered_address VARCHAR(32),
  subscription_status VARCHAR(32),
  primary_language VARCHAR(32),
  software_administrator_id INTEGER,
  method_id INTEGER,
  labor_costing_software_id INTEGER,
  PRIMARY KEY (vat_number),
  FOREIGN KEY (software_administrator_id) REFERENCES software_administrators (id),
  FOREIGN KEY (method_id) REFERENCES work_methods (method_id),
  FOREIGN KEY (labor_costing_software_id) REFERENCES labor_costing_softwares (id)
);
