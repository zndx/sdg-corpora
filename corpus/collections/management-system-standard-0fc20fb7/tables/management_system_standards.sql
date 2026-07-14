CREATE TABLE management_system_standards (
  management_system_standard_id INTEGER NOT NULL,
  standard_identifier VARCHAR(32),
  publication_date DATE,
  issuing_body VARCHAR(32),
  standard_type VARCHAR(39),
  version_number VARCHAR(32),
  status VARCHAR(32),
  certification_record_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (management_system_standard_id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (certification_record_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
