CREATE TABLE schemes_investors (
  managed_investment_scheme_id INTEGER NOT NULL,
  investor_id INTEGER NOT NULL,
  PRIMARY KEY (managed_investment_scheme_id, investor_id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (id),
  FOREIGN KEY (investor_id) REFERENCES investors (id)
);
