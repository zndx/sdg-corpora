CREATE TABLE prod_price_forecasts (
  id INTEGER NOT NULL,
  forecast_id VARCHAR(44),
  target_price DECIMAL,
  currency VARCHAR(32),
  year INTEGER,
  commodity VARCHAR(32),
  issuing_body VARCHAR(32),
  institution_id INTEGER,
  commodity_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (institution_id) REFERENCES prod_institutions (institution_id),
  FOREIGN KEY (commodity_id) REFERENCES prod_commodities (commodity_id)
);
