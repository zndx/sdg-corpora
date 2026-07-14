CREATE TABLE processes_pages (
  scanning_process_id INTEGER NOT NULL,
  application_page_id INTEGER NOT NULL,
  PRIMARY KEY (scanning_process_id, application_page_id),
  FOREIGN KEY (scanning_process_id) REFERENCES scanning_processes (id),
  FOREIGN KEY (application_page_id) REFERENCES application_pages (application_page_id)
);
