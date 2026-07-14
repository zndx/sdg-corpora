CREATE TABLE extracted_personal_data_records (
  extracted_personal_data_record_id INTEGER NOT NULL,
  record_identifier VARCHAR(32),
  extraction_method VARCHAR(32),
  source_language_code VARCHAR(32),
  output_format VARCHAR(32),
  data_archive_status VARCHAR(32),
  extraction_timestamp TIMESTAMP,
  official_identification_document_id INTEGER,
  optical_character_recognition_engine_id INTEGER,
  PRIMARY KEY (extracted_personal_data_record_id),
  FOREIGN KEY (official_identification_document_id) REFERENCES official_identification_documents (official_identification_document_id),
  FOREIGN KEY (optical_character_recognition_engine_id) REFERENCES optical_character_recognition_engines (id)
);
