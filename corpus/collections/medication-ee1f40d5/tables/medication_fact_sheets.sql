CREATE TABLE medication_fact_sheets (
  id INTEGER NOT NULL,
  fact_sheet_id INTEGER,
  title VARCHAR(32),
  last_updated TIMESTAMP,
  source_system VARCHAR(32),
  language VARCHAR(32),
  readability_level VARCHAR(32),
  medication_id INTEGER,
  display_endpoint_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (medication_id) REFERENCES medications (id),
  FOREIGN KEY (display_endpoint_id) REFERENCES display_endpoints (id)
);
