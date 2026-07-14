CREATE TABLE elements_materials (
  chemical_element_id INTEGER NOT NULL,
  catalytic_material_id INTEGER NOT NULL,
  PRIMARY KEY (chemical_element_id, catalytic_material_id),
  FOREIGN KEY (chemical_element_id) REFERENCES chemical_elements (id),
  FOREIGN KEY (catalytic_material_id) REFERENCES catalytic_materials (id)
);
