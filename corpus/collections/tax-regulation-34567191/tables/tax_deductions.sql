CREATE TABLE tax_deductions (
  tax_deduction_id INTEGER NOT NULL,
  deduction_percentage DECIMAL,
  max_deduction_amount VARCHAR(32),
  effective_tax_rate DECIMAL,
  phase_in_threshold DECIMAL,
  phase_out_threshold DECIMAL,
  applies_to_a_m_t BOOLEAN,
  affects_basis BOOLEAN,
  affects_n_i_i BOOLEAN,
  qualified_business_income_id INTEGER,
  wage_asset_test_id INTEGER,
  disqualified_activity_id INTEGER,
  PRIMARY KEY (tax_deduction_id),
  FOREIGN KEY (qualified_business_income_id) REFERENCES qualified_business_incomes (id),
  FOREIGN KEY (wage_asset_test_id) REFERENCES wage_asset_tests (id),
  FOREIGN KEY (disqualified_activity_id) REFERENCES disqualified_activities (id)
);
