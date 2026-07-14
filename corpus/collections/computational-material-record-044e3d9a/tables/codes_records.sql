CREATE TABLE codes_records (
  computational_code_id INTEGER NOT NULL,
  computational_material_record_id INTEGER NOT NULL,
  PRIMARY KEY (computational_code_id, computational_material_record_id),
  FOREIGN KEY (computational_code_id) REFERENCES computational_codes (id),
  FOREIGN KEY (computational_material_record_id) REFERENCES computational_material_records (computational_material_record_id)
);
