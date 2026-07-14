CREATE TABLE tariffs_events (
  tariff_code VARCHAR(32) NOT NULL,
  energy_consumption_event_id INTEGER NOT NULL,
  PRIMARY KEY (tariff_code, energy_consumption_event_id),
  FOREIGN KEY (tariff_code) REFERENCES energy_tariffs (tariff_code),
  FOREIGN KEY (energy_consumption_event_id) REFERENCES energy_consumption_events (id)
);
