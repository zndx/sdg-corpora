CREATE TABLE official_identification_documents (
  official_identification_document_id INTEGER NOT NULL,
  document_type VARCHAR(32),
  issuing_country_code VARCHAR(38),
  document_number VARCHAR(32),
  m_r_z_line1 VARCHAR(32),
  m_r_z_line2 VARCHAR(32),
  m_r_z_recognition_status VARCHAR(32),
  extraction_timestamp TIMESTAMP,
  extracted_personal_data_record_id INTEGER,
  hardware_scanner_device_id INTEGER,
  PRIMARY KEY (official_identification_document_id),
  FOREIGN KEY (extracted_personal_data_record_id) REFERENCES extracted_personal_data_records (extracted_personal_data_record_id),
  FOREIGN KEY (hardware_scanner_device_id) REFERENCES hardware_scanner_devices (id)
);
