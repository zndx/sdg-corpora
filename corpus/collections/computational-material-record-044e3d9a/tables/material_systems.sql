CREATE TABLE material_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  chemical_formula VARCHAR(32),
  crystal_system VARCHAR(32),
  space_group_number INTEGER,
  lattice_parameter_a DECIMAL,
  lattice_parameter_b DECIMAL,
  lattice_parameter_c DECIMAL,
  formation_energy DECIMAL,
  material_property_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (material_property_id) REFERENCES material_properties (id)
);
