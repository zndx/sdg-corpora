CREATE TABLE pipelines_records (
  pipeline_id VARCHAR(32) NOT NULL,
  computational_material_record_id INTEGER NOT NULL,
  PRIMARY KEY (pipeline_id, computational_material_record_id),
  FOREIGN KEY (pipeline_id) REFERENCES parsing_pipelines (pipeline_id),
  FOREIGN KEY (computational_material_record_id) REFERENCES computational_material_records (computational_material_record_id)
);
