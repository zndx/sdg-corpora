CREATE TABLE application_documents (
  document_id VARCHAR(44) NOT NULL,
  file_name VARCHAR(32),
  file_size_bytes INTEGER,
  page_count INTEGER,
  creation_date TIMESTAMP,
  format VARCHAR(32),
  scanning_process_id INTEGER,
  PRIMARY KEY (document_id),
  FOREIGN KEY (scanning_process_id) REFERENCES scanning_processes (id)
);
