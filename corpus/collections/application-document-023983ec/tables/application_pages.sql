CREATE TABLE application_pages (
  application_page_id INTEGER NOT NULL,
  page_number INTEGER,
  content_type VARCHAR(32),
  image_resolution DECIMAL,
  is_color VARCHAR(32),
  orientation VARCHAR(32),
  document_id VARCHAR(44),
  scanning_process_id INTEGER,
  PRIMARY KEY (application_page_id),
  FOREIGN KEY (document_id) REFERENCES application_documents (document_id),
  FOREIGN KEY (scanning_process_id) REFERENCES scanning_processes (id)
);
