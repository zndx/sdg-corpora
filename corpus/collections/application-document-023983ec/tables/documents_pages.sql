CREATE TABLE documents_pages (
  document_id VARCHAR(44) NOT NULL,
  application_page_id INTEGER NOT NULL,
  PRIMARY KEY (document_id, application_page_id),
  FOREIGN KEY (document_id) REFERENCES application_documents (document_id),
  FOREIGN KEY (application_page_id) REFERENCES application_pages (application_page_id)
);
