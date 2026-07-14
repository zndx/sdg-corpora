CREATE TABLE appliances_events (
  energy_appliance_id INTEGER NOT NULL,
  energy_consumption_event_id INTEGER NOT NULL,
  PRIMARY KEY (energy_appliance_id, energy_consumption_event_id),
  FOREIGN KEY (energy_appliance_id) REFERENCES energy_appliances (id),
  FOREIGN KEY (energy_consumption_event_id) REFERENCES energy_consumption_events (id)
);
