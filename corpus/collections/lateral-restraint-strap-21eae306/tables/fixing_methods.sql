CREATE TABLE fixing_methods (
  fixing_method_id INTEGER NOT NULL,
  method_identifier VARCHAR(32),
  screw_length DECIMAL,
  screw_gauge INTEGER,
  plug_type VARCHAR(32),
  screw_spacing DECIMAL,
  min_screws_per_strap INTEGER,
  applies_to_material VARCHAR(32),
  lateral_restraint_strap_id INTEGER,
  floor_assembly_id INTEGER,
  PRIMARY KEY (fixing_method_id),
  FOREIGN KEY (lateral_restraint_strap_id) REFERENCES lateral_restraint_straps (id),
  FOREIGN KEY (floor_assembly_id) REFERENCES floor_assemblies (id)
);
