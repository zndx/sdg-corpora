CREATE TABLE masonry_walls (
  masonry_wall_id INTEGER NOT NULL,
  wall_identifier VARCHAR(32),
  wall_height DECIMAL,
  wall_type VARCHAR(32),
  masonry_unit_type VARCHAR(32),
  structural_role VARCHAR(32),
  lateral_restraint_strap_id INTEGER,
  floor_assembly_id INTEGER,
  PRIMARY KEY (masonry_wall_id),
  FOREIGN KEY (lateral_restraint_strap_id) REFERENCES lateral_restraint_straps (id),
  FOREIGN KEY (floor_assembly_id) REFERENCES floor_assemblies (id)
);
