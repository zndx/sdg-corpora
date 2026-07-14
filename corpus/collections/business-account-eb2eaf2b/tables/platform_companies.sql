CREATE TABLE platform_companies (
  id INTEGER NOT NULL,
  company_registration_number VARCHAR(32),
  vat_number VARCHAR(32),
  registered_office VARCHAR(32),
  jurisdiction VARCHAR(32),
  labor_costing_software_id INTEGER,
  standard_element_library_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (labor_costing_software_id) REFERENCES labor_costing_softwares (id),
  FOREIGN KEY (standard_element_library_id) REFERENCES standard_element_libraries (standard_element_library_id)
);
