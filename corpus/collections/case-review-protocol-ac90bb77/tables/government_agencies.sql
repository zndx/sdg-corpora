CREATE TABLE government_agencies (
  government_agency_id INTEGER NOT NULL,
  agency_identifier VARCHAR(42),
  agency_name VARCHAR(37),
  jurisdiction_level VARCHAR(32),
  service_type VARCHAR(32),
  established_date DATE,
  system_domain_id INTEGER,
  legal_case_id INTEGER,
  PRIMARY KEY (government_agency_id),
  FOREIGN KEY (system_domain_id) REFERENCES system_domains (id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id)
);
