CREATE TABLE powertrains (
  powertrain_id INTEGER NOT NULL,
  engine_type VARCHAR(32),
  displacement DECIMAL,
  horsepower DECIMAL,
  cooling_method VARCHAR(32),
  fuel_delivery_system VARCHAR(32),
  transmission_type VARCHAR(32),
  gear_positions VARCHAR(32),
  drive_mode VARCHAR(32),
  wheel_assembly_id INTEGER,
  PRIMARY KEY (powertrain_id),
  FOREIGN KEY (wheel_assembly_id) REFERENCES wheel_assemblies (wheel_assembly_id)
);
