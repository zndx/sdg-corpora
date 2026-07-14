CREATE TABLE price_forecasts (
  id INTEGER NOT NULL,
  forecast_id VARCHAR(44),
  issue_date DATE,
  target_year INTEGER,
  price_value DECIMAL,
  currency_code VARCHAR(44),
  forecast_source VARCHAR(32),
  commodity_name VARCHAR(32),
  corporate_entity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (id)
);
