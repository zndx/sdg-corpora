CREATE TABLE regulatory_instruments (
  regulatory_instrument_id INTEGER NOT NULL,
  instrument_identifier VARCHAR(32),
  title VARCHAR(32),
  issuing_authority VARCHAR(32),
  adoption_date TIMESTAMP,
  publication_date TIMESTAMP,
  entry_into_force_date TIMESTAMP,
  status VARCHAR(32),
  supersedes_regulatory_instrument_id INTEGER,
  amends_regulatory_instrument_id INTEGER,
  financial_counterparty_id INTEGER,
  PRIMARY KEY (regulatory_instrument_id),
  FOREIGN KEY (supersedes_regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id),
  FOREIGN KEY (amends_regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id),
  FOREIGN KEY (financial_counterparty_id) REFERENCES financial_counterparties (financial_counterparty_id)
);
