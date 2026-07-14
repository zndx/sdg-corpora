CREATE TABLE development_fundings (
  development_funding_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  amount DECIMAL,
  currency VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  purpose VARCHAR(32),
  overseas_territory_id INTEGER,
  PRIMARY KEY (development_funding_id),
  FOREIGN KEY (overseas_territory_id) REFERENCES overseas_territories (id)
);
