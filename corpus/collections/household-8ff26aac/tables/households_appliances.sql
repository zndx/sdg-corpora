CREATE TABLE households_appliances (
  household_id INTEGER NOT NULL,
  energy_appliance_id INTEGER NOT NULL,
  PRIMARY KEY (household_id, energy_appliance_id),
  FOREIGN KEY (household_id) REFERENCES households (id),
  FOREIGN KEY (energy_appliance_id) REFERENCES energy_appliances (id)
);
