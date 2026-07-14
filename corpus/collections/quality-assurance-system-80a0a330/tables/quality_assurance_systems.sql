CREATE TABLE quality_assurance_systems (
  quality_assurance_system_id INTEGER NOT NULL,
  system_id INTEGER,
  name VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  region VARCHAR(32),
  framework_version VARCHAR(32),
  institutional_reform_id INTEGER,
  regional_qualifications_framework_id INTEGER,
  quality_assurance_office_id INTEGER,
  PRIMARY KEY (quality_assurance_system_id),
  FOREIGN KEY (institutional_reform_id) REFERENCES institutional_reforms (id),
  FOREIGN KEY (regional_qualifications_framework_id) REFERENCES regional_qualifications_frameworks (id),
  FOREIGN KEY (quality_assurance_office_id) REFERENCES quality_assurance_offices (id)
);
