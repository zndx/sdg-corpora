CREATE TABLE computational_material_records (
  computational_material_record_id INTEGER NOT NULL,
  record_id INTEGER,
  creation_date TIMESTAMP,
  file_size_bytes INTEGER,
  file_format VARCHAR(32),
  status VARCHAR(32),
  checksum VARCHAR(32),
  computational_code_id INTEGER,
  material_system_id INTEGER,
  pipeline_id VARCHAR(32),
  PRIMARY KEY (computational_material_record_id),
  FOREIGN KEY (computational_code_id) REFERENCES computational_codes (id),
  FOREIGN KEY (material_system_id) REFERENCES material_systems (id),
  FOREIGN KEY (pipeline_id) REFERENCES parsing_pipelines (pipeline_id)
);
