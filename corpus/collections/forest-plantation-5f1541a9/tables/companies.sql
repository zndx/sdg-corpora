CREATE TABLE companies (
  company_id VARCHAR(32) NOT NULL,
  company_name VARCHAR(32),
  founding_year INTEGER,
  headquarters VARCHAR(32),
  shareholder_count INTEGER,
  employee_count INTEGER,
  carbon_credit_id INTEGER,
  PRIMARY KEY (company_id),
  FOREIGN KEY (carbon_credit_id) REFERENCES carbon_credits (id)
);
