CREATE TABLE glazing_ratios (
  id INTEGER NOT NULL,
  glazing_ratio_id INTEGER,
  wall_area DECIMAL,
  glazing_area DECIMAL,
  ratio_percentage DECIMAL,
  orientation VARCHAR(32),
  building_shape_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (building_shape_id) REFERENCES building_shapes (building_shape_id)
);
