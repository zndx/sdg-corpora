CREATE TABLE energy_simulations (
  id INTEGER NOT NULL,
  simulation_id VARCHAR(44),
  simulation_date TIMESTAMP,
  energy_consumption DECIMAL,
  heating_load DECIMAL,
  cooling_load DECIMAL,
  ventilation_rate DECIMAL,
  indoor_temperature DECIMAL,
  outdoor_temperature DECIMAL,
  building_shape_id INTEGER,
  building_material_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (building_shape_id) REFERENCES building_shapes (building_shape_id),
  FOREIGN KEY (building_material_id) REFERENCES building_materials (id)
);
