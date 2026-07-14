CREATE TABLE prod_institutionsPriceForecast (
  institution_id INTEGER NOT NULL,
  price_forecast_id INTEGER NOT NULL,
  PRIMARY KEY (institution_id, price_forecast_id),
  FOREIGN KEY (institution_id) REFERENCES prod_institutions (institution_id),
  FOREIGN KEY (price_forecast_id) REFERENCES prod_price_forecasts (id)
);
