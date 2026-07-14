CREATE TABLE wage_asset_tests (
  id INTEGER NOT NULL,
  wage_limit DECIMAL,
  asset_limit DECIMAL,
  combined_limit DECIMAL,
  phase_in_percentage DECIMAL,
  is_fully_applicable BOOLEAN,
  test_year INTEGER,
  trade_or_business_employer_id VARCHAR(61),
  tax_deduction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (trade_or_business_employer_id) REFERENCES trade_or_businesses (employer_id),
  FOREIGN KEY (tax_deduction_id) REFERENCES tax_deductions (tax_deduction_id)
);
