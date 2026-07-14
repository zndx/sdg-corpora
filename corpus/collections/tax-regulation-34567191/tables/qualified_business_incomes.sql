CREATE TABLE qualified_business_incomes (
  id INTEGER NOT NULL,
  income_amount VARCHAR(32),
  loss_amount DECIMAL,
  net_q_b_i DECIMAL,
  carried_forward_loss DECIMAL,
  source_type VARCHAR(32),
  is_s_s_t_b BOOLEAN,
  calculation_year INTEGER,
  trade_or_business_employer_id VARCHAR(61),
  wage_asset_test_id INTEGER,
  disqualified_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (trade_or_business_employer_id) REFERENCES trade_or_businesses (employer_id),
  FOREIGN KEY (wage_asset_test_id) REFERENCES wage_asset_tests (id),
  FOREIGN KEY (disqualified_activity_id) REFERENCES disqualified_activities (id)
);
