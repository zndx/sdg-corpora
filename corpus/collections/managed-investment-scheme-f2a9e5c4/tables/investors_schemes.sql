CREATE TABLE investors_schemes (
  investor_id INTEGER NOT NULL,
  managed_investment_scheme_id INTEGER NOT NULL,
  PRIMARY KEY (investor_id, managed_investment_scheme_id),
  FOREIGN KEY (investor_id) REFERENCES investors (id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (id)
);
