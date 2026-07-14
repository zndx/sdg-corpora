CREATE TABLE optimization_processes (
  id INTEGER NOT NULL,
  process_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  cost_reduction VARCHAR(32),
  efficiency_gain DECIMAL,
  status VARCHAR(32),
  building_shape_id INTEGER,
  energy_simulation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (building_shape_id) REFERENCES building_shapes (building_shape_id),
  FOREIGN KEY (energy_simulation_id) REFERENCES energy_simulations (id)
);
