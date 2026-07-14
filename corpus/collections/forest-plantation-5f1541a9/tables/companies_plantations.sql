CREATE TABLE companies_plantations (
  company_id VARCHAR(32) NOT NULL,
  forest_plantation_id INTEGER NOT NULL,
  PRIMARY KEY (company_id, forest_plantation_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (forest_plantation_id) REFERENCES forest_plantations (id)
);
