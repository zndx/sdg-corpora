CREATE TABLE representatives_schemes (
  authorised_representative_id INTEGER NOT NULL,
  managed_investment_scheme_id INTEGER NOT NULL,
  PRIMARY KEY (authorised_representative_id, managed_investment_scheme_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (managed_investment_scheme_id)
);
