CREATE TABLE floor_assemblies (
  id INTEGER NOT NULL,
  assembly_identifier VARCHAR(32),
  assembly_type VARCHAR(32),
  infill_material VARCHAR(32),
  tolerance_level VARCHAR(32),
  floor_height DECIMAL,
  lateral_restraint_strap_id INTEGER,
  masonry_wall_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lateral_restraint_strap_id) REFERENCES lateral_restraint_straps (id),
  FOREIGN KEY (masonry_wall_id) REFERENCES masonry_walls (masonry_wall_id)
);
