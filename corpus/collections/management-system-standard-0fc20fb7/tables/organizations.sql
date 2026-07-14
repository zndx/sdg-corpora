CREATE TABLE organizations (
  organization_id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  country VARCHAR(32),
  region VARCHAR(32),
  industry_sector VARCHAR(32),
  employee_count INTEGER,
  certification_record_id INTEGER,
  management_system_standard_id INTEGER,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (certification_record_id),
  FOREIGN KEY (management_system_standard_id) REFERENCES management_system_standards (management_system_standard_id)
);
