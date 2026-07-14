CREATE TABLE building_shapes (
  building_shape_id INTEGER NOT NULL,
  shape_id VARCHAR(44),
  ground_plan_type VARCHAR(32),
  vertical_division_type VARCHAR(32),
  volume DECIMAL,
  surface_area DECIMAL,
  shape_factor DECIMAL,
  aerodynamic_coefficient DECIMAL,
  energy_simulation_id INTEGER,
  glazing_ratio_id INTEGER,
  PRIMARY KEY (building_shape_id),
  FOREIGN KEY (energy_simulation_id) REFERENCES energy_simulations (id),
  FOREIGN KEY (glazing_ratio_id) REFERENCES glazing_ratios (id)
);
