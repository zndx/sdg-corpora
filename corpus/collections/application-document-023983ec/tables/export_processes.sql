CREATE TABLE export_processes (
  export_id VARCHAR(44) NOT NULL,
  export_date TIMESTAMP,
  method VARCHAR(32),
  target_file_size_m_b DECIMAL,
  status VARCHAR(32),
  document_id VARCHAR(44),
  export_method_id INTEGER,
  PRIMARY KEY (export_id),
  FOREIGN KEY (document_id) REFERENCES application_documents (document_id),
  FOREIGN KEY (export_method_id) REFERENCES export_methods (id)
);
