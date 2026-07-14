CREATE TABLE consultants_appliances (
  consultant_id VARCHAR(44) NOT NULL,
  energy_appliance_id INTEGER NOT NULL,
  PRIMARY KEY (consultant_id, energy_appliance_id),
  FOREIGN KEY (consultant_id) REFERENCES energy_consultants (consultant_id),
  FOREIGN KEY (energy_appliance_id) REFERENCES energy_appliances (id)
);
