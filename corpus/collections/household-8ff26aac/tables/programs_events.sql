CREATE TABLE programs_events (
  program_id INTEGER NOT NULL,
  energy_consumption_event_id INTEGER NOT NULL,
  PRIMARY KEY (program_id, energy_consumption_event_id),
  FOREIGN KEY (program_id) REFERENCES home_energy_reduction_programs (program_id),
  FOREIGN KEY (energy_consumption_event_id) REFERENCES energy_consumption_events (id)
);
