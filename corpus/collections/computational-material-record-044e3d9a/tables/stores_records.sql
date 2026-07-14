CREATE TABLE stores_records (
  parsed_data_store_id INTEGER NOT NULL,
  computational_material_record_id INTEGER NOT NULL,
  PRIMARY KEY (parsed_data_store_id, computational_material_record_id),
  FOREIGN KEY (parsed_data_store_id) REFERENCES parsed_data_stores (parsed_data_store_id),
  FOREIGN KEY (computational_material_record_id) REFERENCES computational_material_records (computational_material_record_id)
);
