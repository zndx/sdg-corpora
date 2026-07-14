CREATE TABLE meters_events (
  electricity_meter_id INTEGER NOT NULL,
  energy_consumption_event_id INTEGER NOT NULL,
  PRIMARY KEY (electricity_meter_id, energy_consumption_event_id),
  FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meters (electricity_meter_id),
  FOREIGN KEY (energy_consumption_event_id) REFERENCES energy_consumption_events (id)
);
