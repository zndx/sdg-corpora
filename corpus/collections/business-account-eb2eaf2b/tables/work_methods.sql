CREATE TABLE work_methods (
  method_id INTEGER NOT NULL,
  data_classification VARCHAR(32),
  creation_date TIMESTAMP,
  export_format VARCHAR(32),
  language_code VARCHAR(32),
  business_account_vat_number VARCHAR(32),
  standard_element_library_id INTEGER,
  PRIMARY KEY (method_id),
  FOREIGN KEY (business_account_vat_number) REFERENCES business_accounts (vat_number),
  FOREIGN KEY (standard_element_library_id) REFERENCES standard_element_libraries (standard_element_library_id)
);
