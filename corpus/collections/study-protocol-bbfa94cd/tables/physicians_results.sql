CREATE TABLE physicians_results (
  physician_id INTEGER NOT NULL,
  scan_result_id INTEGER NOT NULL,
  PRIMARY KEY (physician_id, scan_result_id),
  FOREIGN KEY (physician_id) REFERENCES physicians (physician_id),
  FOREIGN KEY (scan_result_id) REFERENCES scan_results (id)
);
