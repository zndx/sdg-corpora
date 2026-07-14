CREATE TABLE prod_commoditiesPriceForecast (
  commodity_id INTEGER NOT NULL,
  price_forecast_id INTEGER NOT NULL,
  PRIMARY KEY (commodity_id, price_forecast_id),
  FOREIGN KEY (commodity_id) REFERENCES prod_commodities (commodity_id),
  FOREIGN KEY (price_forecast_id) REFERENCES prod_price_forecasts (id)
);
