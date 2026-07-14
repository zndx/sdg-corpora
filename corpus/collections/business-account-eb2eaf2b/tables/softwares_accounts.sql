CREATE TABLE softwares_accounts (
  labor_costing_software_id INTEGER NOT NULL,
  business_account_vat_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (labor_costing_software_id, business_account_vat_number),
  FOREIGN KEY (labor_costing_software_id) REFERENCES labor_costing_softwares (id),
  FOREIGN KEY (business_account_vat_number) REFERENCES business_accounts (vat_number)
);
