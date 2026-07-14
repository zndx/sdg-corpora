CREATE TABLE optical_character_recognition_engines (
  id INTEGER NOT NULL,
  engine_version VARCHAR(32),
  supported_language_count INTEGER,
  recognition_accuracy DECIMAL,
  processing_speed DECIMAL,
  award_status BOOLEAN,
  official_identification_document_id INTEGER,
  extracted_personal_data_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (official_identification_document_id) REFERENCES official_identification_documents (official_identification_document_id),
  FOREIGN KEY (extracted_personal_data_record_id) REFERENCES extracted_personal_data_records (extracted_personal_data_record_id)
);
