CREATE TABLE imaging_procedures (
  id INTEGER NOT NULL,
  procedure_id VARCHAR(32),
  procedure_date TIMESTAMP,
  modality VARCHAR(32),
  anatomical_region VARCHAR(32),
  tracer_agent VARCHAR(32),
  facility_id VARCHAR(35),
  imaging_facility_id INTEGER,
  physician_id INTEGER,
  interpreted_by_physician_id INTEGER,
  scan_result_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (imaging_facility_id) REFERENCES imaging_facilities (imaging_facility_id),
  FOREIGN KEY (physician_id) REFERENCES physicians (physician_id),
  FOREIGN KEY (interpreted_by_physician_id) REFERENCES physicians (physician_id),
  FOREIGN KEY (scan_result_id) REFERENCES scan_results (id)
);
