CREATE TABLE companies_facilities (
  company_id VARCHAR(32) NOT NULL,
  industrial_facility_id INTEGER NOT NULL,
  PRIMARY KEY (company_id, industrial_facility_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (industrial_facility_id) REFERENCES industrial_facilities (id)
);
