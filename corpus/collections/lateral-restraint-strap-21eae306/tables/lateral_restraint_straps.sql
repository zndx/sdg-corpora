CREATE TABLE lateral_restraint_straps (
  id INTEGER NOT NULL,
  strap_identifier VARCHAR(32),
  minimum_length DECIMAL,
  gauge INTEGER,
  material VARCHAR(32),
  turn_down_configuration VARCHAR(32),
  max_spacing_along_wall DECIMAL,
  masonry_wall_id INTEGER,
  floor_assembly_id INTEGER,
  fixing_method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (masonry_wall_id) REFERENCES masonry_walls (masonry_wall_id),
  FOREIGN KEY (floor_assembly_id) REFERENCES floor_assemblies (id),
  FOREIGN KEY (fixing_method_id) REFERENCES fixing_methods (fixing_method_id)
);
