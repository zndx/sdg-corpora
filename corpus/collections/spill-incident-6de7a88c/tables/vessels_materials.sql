CREATE TABLE vessels_materials (
  vessel_id INTEGER NOT NULL,
  hazardous_material_id INTEGER NOT NULL,
  PRIMARY KEY (vessel_id, hazardous_material_id),
  FOREIGN KEY (vessel_id) REFERENCES vessels (id),
  FOREIGN KEY (hazardous_material_id) REFERENCES hazardous_materials (id)
);
