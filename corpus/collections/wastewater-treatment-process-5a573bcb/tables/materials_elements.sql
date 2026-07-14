CREATE TABLE materials_elements (
  catalytic_material_id INTEGER NOT NULL,
  chemical_element_id INTEGER NOT NULL,
  PRIMARY KEY (catalytic_material_id, chemical_element_id),
  FOREIGN KEY (catalytic_material_id) REFERENCES catalytic_materials (id),
  FOREIGN KEY (chemical_element_id) REFERENCES chemical_elements (id)
);
