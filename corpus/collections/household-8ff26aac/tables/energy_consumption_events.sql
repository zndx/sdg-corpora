CREATE TABLE energy_consumption_events (
  id INTEGER NOT NULL,
  event_timestamp TIMESTAMP,
  consumption_kwh DECIMAL,
  interval_duration INTEGER,
  measurement_quality VARCHAR(32),
  tariff_band VARCHAR(32),
  electricity_meter_id INTEGER,
  household_id INTEGER,
  tariff_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meters (electricity_meter_id),
  FOREIGN KEY (household_id) REFERENCES households (id),
  FOREIGN KEY (tariff_code) REFERENCES energy_tariffs (tariff_code)
);
