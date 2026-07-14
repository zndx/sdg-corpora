CREATE TABLE managed_investment_schemes (
  managed_investment_scheme_id INTEGER NOT NULL,
  scheme_identifier VARCHAR(32),
  scheme_name VARCHAR(32),
  responsible_entity VARCHAR(32),
  is_unlisted BOOLEAN,
  establishment_date DATE,
  financial_licence_id INTEGER,
  PRIMARY KEY (managed_investment_scheme_id),
  FOREIGN KEY (financial_licence_id) REFERENCES financial_licences (id)
);
