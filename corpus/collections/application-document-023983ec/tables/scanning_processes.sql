CREATE TABLE scanning_processes (
  id INTEGER NOT NULL,
  process_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  device_type VARCHAR(32),
  app_used VARCHAR(32),
  status VARCHAR(32),
  document_id VARCHAR(44),
  mobile_device_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (document_id) REFERENCES application_documents (document_id),
  FOREIGN KEY (mobile_device_id) REFERENCES mobile_devices (id)
);
