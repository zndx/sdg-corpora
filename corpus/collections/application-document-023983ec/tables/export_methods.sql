CREATE TABLE export_methods (
  id INTEGER NOT NULL,
  method_id INTEGER,
  method_name VARCHAR(32),
  supports_compression BOOLEAN,
  max_file_size_g_b DECIMAL,
  export_process_export_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (export_process_export_id) REFERENCES export_processes (export_id)
);
