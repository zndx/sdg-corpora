CREATE TABLE systems_records (
  material_system_id INTEGER NOT NULL,
  computational_material_record_id INTEGER NOT NULL,
  PRIMARY KEY (material_system_id, computational_material_record_id),
  FOREIGN KEY (material_system_id) REFERENCES material_systems (id),
  FOREIGN KEY (computational_material_record_id) REFERENCES computational_material_records (computational_material_record_id)
);
