CREATE TABLE energy_tariffs (
  tariff_code VARCHAR(32) NOT NULL,
  provider_name VARCHAR(32),
  base_charge DECIMAL,
  rate_per_kwh DECIMAL,
  effective_date DATE,
  expiration_date DATE,
  PRIMARY KEY (tariff_code)
);
