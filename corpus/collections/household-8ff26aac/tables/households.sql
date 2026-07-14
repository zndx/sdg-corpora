CREATE TABLE households (
  id INTEGER NOT NULL,
  household_id INTEGER,
  address VARCHAR(32),
  occupancy_status VARCHAR(32),
  construction_year INTEGER,
  floor_area DECIMAL,
  electricity_meter_id INTEGER,
  program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meters (electricity_meter_id),
  FOREIGN KEY (program_id) REFERENCES home_energy_reduction_programs (program_id)
);
