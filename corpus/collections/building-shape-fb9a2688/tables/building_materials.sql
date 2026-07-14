CREATE TABLE building_materials (
  id INTEGER NOT NULL,
  material_id VARCHAR(44),
  material_name VARCHAR(32),
  thermal_conductivity DECIMAL,
  density DECIMAL,
  thickness DECIMAL,
  installation_date DATE,
  energy_simulation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (energy_simulation_id) REFERENCES energy_simulations (id)
);
