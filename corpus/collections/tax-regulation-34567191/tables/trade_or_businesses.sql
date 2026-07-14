CREATE TABLE trade_or_businesses (
  entity_type VARCHAR(32),
  employer_id VARCHAR(61) NOT NULL,
  location VARCHAR(32),
  is_s_s_t_b BOOLEAN,
  total_wages_paid DECIMAL,
  unadjusted_basis_of_property DECIMAL,
  tax_year INTEGER,
  qualified_business_income_id INTEGER,
  wage_asset_test_id INTEGER,
  disqualified_activity_id INTEGER,
  PRIMARY KEY (employer_id),
  FOREIGN KEY (qualified_business_income_id) REFERENCES qualified_business_incomes (id),
  FOREIGN KEY (wage_asset_test_id) REFERENCES wage_asset_tests (id),
  FOREIGN KEY (disqualified_activity_id) REFERENCES disqualified_activities (id)
);
